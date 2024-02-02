using System;
using System.Drawing;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows.Forms;


namespace RobvanderWoude
{
	internal static class ProgressBarGUI
	{
		static readonly string progver = "1.00";


		#region Global Variables

		static System.Timers.Timer timeouttimer = new System.Timers.Timer( );
		static Form dialog = new FormDialog( ) { ShowInTaskbar = false };
		static ProgressBar progressbar = new ProgressBar( );
		static Label labeldescription = new Label( );
		static Label helptext = new Label( );
		static string tempfile = Path.Combine( Environment.CurrentDirectory, "progress.tmp" ); // file this program reads its progress from
		static float currentvalue = 0F;
		static int min = 0;   // minimum value for progress bar
		static int max = 100; // maximum value for progress bar
		static int range = 100; // difference between max and min
		static int height = 100; // height of dialog window
		static int width = 600;  // width of dialog window
		static bool debug = false;

		#endregion Global Variables


		[STAThread]
		static void Main( string[] args )
		{
			#region Allow Only Single Instance

			// Code to allow only single instance of program by michalczerwinski
			// https://stackoverflow.com/a/6486341

			bool result = false;
			string uniqueid = string.Format( "ProgressbarGUI-{0}", Environment.GetEnvironmentVariable( "ComputerName" ) );
			Mutex mutex = new Mutex( true, uniqueid, out result );

			if ( !result )
			{
				MessageBox.Show( "Another instance is running already.", string.Format( "ProgressBarGUI, Version {0}", progver ) );
				return;
			}

			#endregion Allow Only Single Instance


			#region Initialize Variables

			int interval = 1000; // progress refresh inteval in milliseconds
			int timeout = 3600;  // program timeout in seconds, 1 hour default
			int x = (int)( ( Screen.PrimaryScreen.WorkingArea.Width - width ) / 2 );   // X-position of top of dialog window
			int y = (int)( ( Screen.PrimaryScreen.WorkingArea.Height - height ) / 2 ); // Y-position of left side of dialog window
			string caption = string.Empty;     // text above progress bar
			string description = string.Empty; // text below progress bar
			string title = string.Format( "ProgressBarGUI,  Version {0}", progver );   // text in title bar
			bool showscale = true;

			#endregion Initialize Variables


			#region Parse Command Line

			foreach ( string arg in args )
			{
				if ( arg[0] == '/' )
				{
					if ( arg.IndexOfAny( ":=".ToCharArray( ) ) > 1 )
					{
						string key = arg.Substring( 0, arg.IndexOfAny( ":=".ToCharArray( ) ) ).ToUpper( );
						string val = arg.Substring( arg.IndexOfAny( ":=".ToCharArray( ) ) + 1 ).Trim( );
						switch ( key )
						{
							case "/CAPTION":
								caption = val.Replace( "\\n", "\n" ).Replace( "\\t", "\t" );
								break;
							case "/DESCRIPTION":
								description = val.Replace( "\\n", "\n" ).Replace( "\\t", "\t" );
								break;
							case "/FILE":
								if ( !string.IsNullOrWhiteSpace( val ) && !File.Exists( val ) )
								{
									if ( Directory.Exists( Directory.GetParent( val ).FullName ) )
									{
										File.WriteAllText( val, string.Empty );
									}
									else
									{
										ShowHelp( );
										return;
									}
								}
								tempfile = val;
								break;
							case "/HEIGHT":
								if ( !int.TryParse( val, out height ) )
								{
									ShowHelp( );
									return;
								}
								break;
							case "/INTERVAL":
								if ( !int.TryParse( val, out interval ) )
								{
									ShowHelp( );
									return;
								}
								break;
							case "/MAX":
								if ( !int.TryParse( val, out max ) )
								{
									ShowHelp( );
									return;
								}
								break;
							case "/MIN":
								if ( !int.TryParse( val, out min ) )
								{
									ShowHelp( );
									return;
								}
								break;
							case "/POS":
								Regex regex = new Regex( "^(\\d+)[x,;](\\d+)$" );
								if ( regex.IsMatch( val ) )
								{
									MatchCollection matches = regex.Matches( val );
									if ( !int.TryParse( matches[0].Groups[1].Value, out width ) )
									{
										ShowHelp( );
										return;
									}
									if ( !int.TryParse( matches[0].Groups[2].Value, out height ) )
									{
										ShowHelp( );
										return;
									}
								}
								else
								{
									ShowHelp( );
									return;
								}
								break;
							case "/TIMEOUT":
								if ( !int.TryParse( val, out timeout ) )
								{
									ShowHelp( );
									return;
								}
								if ( timeout < 0 || timeout > 86400 ) // 24h max; 0 means no timeout
								{
									ShowHelp( );
									return;
								}
								break;
							case "/TITLE":
								title = val;
								break;
							case "/WIDTH":
								if ( !int.TryParse( val, out width ) )
								{
									ShowHelp( );
									return;
								}
								break;
							default:
								ShowHelp( );
								return;
						}
					}
					else if ( arg.ToUpper( ) == "/DEBUG" )
					{
						debug = true;
					}
					else if ( arg.ToUpper( ) == "/NOSCALE" )
					{
						showscale = false;
					}
					else if ( arg.ToUpper( ) == "/SAMPLES" )
					{
						CreateSamples( );
						ShowHelp( );
						return;
					}
					else
					{
						ShowHelp( );
						return;
					}
				}
			}

			if ( max <= min )
			{
				ShowHelp( );
				return;
			}
			range = max - min;

			if ( debug )
			{
				description = "Debug Mode";
			}

			#endregion Parse Command Line


			#region Timeout

			if ( timeout > 0 )
			{
				timeouttimer.Enabled = true;
				timeouttimer.Interval = timeout * 1000;
				timeouttimer.Elapsed += Timeouttimer_Elapsed;
				timeouttimer.Start( );
			}


			#endregion Timeout


			#region Dialog Window

			dialog.ClientSize = new Size( width, height );
			dialog.Left = x;
			dialog.MaximizeBox = false;
			dialog.MinimizeBox = false;
			dialog.ShowInTaskbar = false;
			dialog.SizeGripStyle = SizeGripStyle.Hide;
			dialog.Text = title;
			dialog.Top = y;
			dialog.TopMost = true;
			dialog.WindowState = FormWindowState.Normal;

			int controlswidth = (int)( width * 0.8 );
			int linespacing = 10;
			int leftmargin = (int)( width / 10 );
			int verticaloffset = linespacing;

			#endregion Dialog Window


			#region Optional Caption

			if ( !string.IsNullOrWhiteSpace( caption ) )
			{
				Label labelcaption = new Label
				{
					AutoSize = true,
					Location = new Point( leftmargin, verticaloffset ),
					MaximumSize = new Size( controlswidth, (int)( height * 0.8 ) ),
					Text = caption
				};
				labelcaption.Font = new Font( labelcaption.Font.FontFamily, 12 );
				dialog.Controls.Add( labelcaption );
				int textheight = (int)GetTextSize( caption, labelcaption.Font ).Height;
				verticaloffset += textheight + linespacing;
			};

			#endregion Optional Caption


			#region Progress Bar and Scale

			verticaloffset = Math.Max( verticaloffset, 35 );

			if ( showscale )
			{
				Label scalemin = new Label
				{
					Padding = new Padding( 0, 0, 5, 0 ),
					Text = min.ToString( ),
					TextAlign = ContentAlignment.MiddleRight,
					Width = leftmargin
				};
				scalemin.Font = new Font( scalemin.Font.FontFamily, 10 );
				scalemin.Location = new Point( 0, verticaloffset );
				dialog.Controls.Add( scalemin );
			}

			progressbar.Maximum = max;
			progressbar.Minimum = min;
			progressbar.Value = (int)( 100F * ( currentvalue - min ) / range );
			progressbar.Width = controlswidth;
			progressbar.Location = new Point( leftmargin, verticaloffset );
			dialog.Controls.Add( progressbar );

			if ( showscale )
			{
				Label scalemax = new Label
				{
					Padding = new Padding( 5, 0, 0, 0 ),
					Text = max.ToString( ),
					TextAlign = ContentAlignment.MiddleLeft,
					Width = leftmargin
				};
				scalemax.Font = new Font( scalemax.Font.FontFamily, 10 );
				scalemax.Location = new Point( width - scalemax.Width, verticaloffset );
				dialog.Controls.Add( scalemax );
			}

			verticaloffset += progressbar.Height + linespacing;
			dialog.Refresh( );

			#endregion Progress Bar


			#region Optional Description

			if ( !string.IsNullOrWhiteSpace( description ) )
			{
				labeldescription = new Label
				{
					AutoSize = true,
					Location = new Point( leftmargin, verticaloffset ),
					MaximumSize = new Size( controlswidth, (int)( height * 0.8 ) ),
					Text = description
				};
				labeldescription.Font = new Font( labeldescription.Font.FontFamily, 10 );
				dialog.Controls.Add( labeldescription );
				int textheight = (int)GetTextSize( description, labeldescription.Font ).Height;
				verticaloffset += textheight;
			};

			#endregion Optional Description


			#region Resize and Show Dialog

			height = Math.Max( height, verticaloffset + 2 * linespacing );
			dialog.ClientSize = new Size( width, height );
			dialog.Visible = true;
			dialog.Activate( );
			dialog.Show( );

			#endregion Resize and Show Dialog


			#region Update Progress Bar

			while ( File.Exists( tempfile ) )
			{
				Thread.Sleep( interval );
				Thread thread = new Thread( UpdateValueThread );
				thread.Start( );
				Application.DoEvents( );
			}

			#endregion Update Progress Bar


			Quit( );
			return;
		}


		static void CreateSamples( )
		{
			string demo1 = ":: Make sure the temporary file exists before starting ProgressBarGUI.exe; it may be empty but it must exist\r\n";
			demo1 += "> progress.tmp ECHO 0\r\n";
			demo1 += ":: Start the first instance of ProgressBarGUI.exe\r\n";
			demo1 += "START ProgressBarGUI.exe /Caption:\"Text above . . .\" /Description:\". . . and below the progress bar.\\nAnother line.\\nAnd one more.\" /Timeout:60\r\n";
			demo1 += ":: Short delay before starting a second instance -- which should fail by the way\r\n";
			demo1 += "TimeOut.exe /T 1 >NUL\r\n";
			demo1 += "START ProgressBarGUI.exe /Caption:\"This second instance should not be allowed to run\"\r\n";
			demo1 += ":: Feed the progress bar some numbers\r\n";
			demo1 += "FOR /L %%A IN (0,5,100) DO (\r\n";
			demo1 += "\tTimeOut.exe /T 1 >NUL\r\n";
			demo1 += "\t> progress.tmp ECHO.%%A\r\n";
			demo1 += ")\r\n";
			demo1 += ":: Wait 5 seconds\r\n";
			demo1 += " TimeOut.exe /T 5\r\n";
			demo1 += ":: Delete the temporary file, which is the \"legitimate\" way to terminate ProgressBarGUI.exe\r\n";
			demo1 += " DEL progress.tmp\r\n";
			using ( StreamWriter demo1batch = new StreamWriter( "progressbargui_demo1.bat", false ) )
			{
				demo1batch.Write( demo1 );
			}

			string demo2 = "@ECHO OFF\r\n";
			demo2 += "SETLOCAL ENABLEDELAYEDEXPANSION\r\n";
			demo2 += ":: Preparation: count DLLs in %windir%\\system32\r\n";
			demo2 += "SET FilesCount=0\r\n";
			demo2 += "FOR %%A IN (%windir%\\system32\\*.dll) DO SET /A FilesCount += 1\r\n";
			demo2 += ":: Make sure the temporary file exists before starting ProgressBarGUI.exe; it may be empty but it must exist\r\n";
			demo2 += "> progress.tmp ECHO 0\r\n";
			demo2 += "START ProgressBarGUI.exe /TITLE:\"List %FilesCount% DLLs in %windir%\\system32\" /Max:%FilesCount% /Debug\r\n";
			demo2 += ":: Feed the progress bar some numbers\r\n";
			demo2 += "SET Count=0\r\n";
			demo2 += "FOR %%A IN (%windir%\\system32\\*.dll) DO (\r\n";
			demo2 += "\tSET /A Count += 1\r\n";
			demo2 += "\tECHO [!Count!]    %%A\r\n";
			demo2 += "\tREM Only refresh the progressbar every 25 files\r\n";
			demo2 += "\tSET /A Test = \"!Count! %% 25\"\r\n";
			demo2 += "\tIF !Test! EQU 0 (\r\n";
			demo2 += "\t\t> progress.tmp ECHO.!Count!\r\n";
			demo2 += "\t\tTimeOut.exe /T 1 >NUL\r\n";
			demo2 += "\t)\r\n";
			demo2 += ")\r\n";
			demo2 += ":: In case the total count is not a multiple of 25\r\n";
			demo2 += "> progress.tmp ECHO.!Count!\r\n";
			demo2 += ":: Wait 5 seconds\r\n";
			demo2 += "TimeOut.exe /T 5\r\n";
			demo2 += ":: Delete the temporary file, which is the \"legitimate\" way to terminate ProgressBarGUI.exe\r\n";
			demo2 += " DEL progress.tmp\r\nENDLOCAL\r\n";
			using ( StreamWriter demo1batch = new StreamWriter( "progressbargui_demo2.bat", false ) )
			{
				demo1batch.Write( demo2 );
			}

			MessageBox.Show( string.Format( "Demo batch files \"progressbargui_demo1.bat\" and \"progressbargui_demo2\" were created in the \"{0}\" folder.", Environment.CurrentDirectory ) );
		}


		static SizeF GetTextSize( string text, Font font )
		{
			Bitmap bitmap = new Bitmap( width, height );
			Graphics graphic = Graphics.FromImage( bitmap );
			SizeF stringsize = new SizeF( );
			stringsize = graphic.MeasureString( text, font );
			return stringsize;
		}


		private static void Helptext_Click( object sender, EventArgs e )
		{
			Clipboard.SetText( helptext.Text );
			MessageBox.Show( "The help text has been copied to the clipboard", "Help Text Copied" );
		}


		static void Quit( )
		{
			try
			{
				timeouttimer.Stop( );
			}
			finally
			{
				System.Windows.Forms.Application.Exit( );
			}
		}


		static void ShowHelp( )
		{
			string message = string.Format( "ProgressBarGUI,  Version {0}\n", progver );
			message += "Batch tool to present a GUI style progress bar\n\n";
			message += "Usage:   PROGRESSBARGUI.EXE  [ options ]\n\n";
			message += "Options: /CAPTION:text            optional text above the progress bar\n";
			message += "         /DEBUG                   show actual value and progress in description\n";
			message += "         /DESCRIPTION:text        optional text underneath the progressbar\n";
			message += "         /FILE:tempfile           text file from which to read progress\n";
			message += "                                  (default: progress.tmp in current directory)\n";
			message += "         /HEIGHT:minimumheight    minimum window height (default: 100)\n";
			message += "         /INTERVAL:milliseconds   progressbar refresh interval (deafult: 1000)\n";
			message += "         /MAX:max                 maximum value for progress bar (default: 100)\n";
			message += "         /MIN:min                 minimum value for progress bar (default: 0)\n";
			message += "         /NOSCALE                 do not show min and max values next to\n";
			message += "                                  progressbar (default: show values)\n";
			message += "         /POS:\"X,Y\"               X,Y position of dialog's top left corner\n";
			message += "                                  (default: center dialog in screen)\n";
			message += "         /SAMPLES                 write 2 sample batch files, demonstrating the\n";
			message += "                                  use of this program, to the current directory.\n";
			message += "         /TIMEOUT:seconds         timeout after which program should exit,\n";
			message += "                                  ready or not (1..86400, or 0 for no timeout,\n";
			message += "                                  default: 3600 seconds = 1 hour)\n";
			message += "         /TITLE:text              dialog's window title\n";
			message += "         /WIDTH:width             dialog's window width (default: 600)\n\n";
			message += "Notes:   The program reads the current value from a temporary file, as\n";
			message += "         specified by the /FILE switch or the default \"progress.tmp\"\n";
			message += "         in the current directory.\n";
			message += "         If /DEBUG switch is used, /DESCRIPTION switch will be ignored.\n";
			message += "         The /HEIGHT switch is not required: if text is added in caption\n";
			message += "         or description, the dialog window height will automatically be\n";
			message += "         resized to make it fit.\n";
			message += "         The dialog window closes when either the temporary file no longer\n";
			message += "         exists, or the timeout has elapsed, or the window is closed manually.\n";
			message += "         Only one single instance of this program is allowed to run, an\n";
			message += "         attempt to start a second instance will return an error message.\n\n";
			message += "Credits: Code to allow only single instance of program by michalczerwinski\n";
			message += "         https://stackoverflow.com/a/6486341\n\n";
			message += "Written by Rob van der Woude\n";
			message += "https://www.robvanderwoude.com";

			Form helpdialog = new Form( )
			{
				AutoSize = true,
				MaximizeBox = false,
				Padding = new Padding( 10 ),
				SizeGripStyle = SizeGripStyle.Hide,
				Text = string.Format( "ProgressBarGUI, Version {0}", progver )
			};
			helptext = new Label( )
			{
				AutoSize = true,
				Font = new Font( FontFamily.GenericMonospace, 12 ),
				Left = 10,
				Text = message,
				Top = 10
			};
			helptext.Click += Helptext_Click;
			helpdialog.Controls.Add( helptext );
			helpdialog.Update( );
			helpdialog.TopMost = true;
			helpdialog.ShowDialog( );
			helpdialog.Activate( );
		}


		private static void Timeouttimer_Elapsed( object sender, System.Timers.ElapsedEventArgs e )
		{
			Quit( );
		}


		static void UpdateValue( )
		{
			if ( File.Exists( tempfile ) )
			{
				try
				{
					using ( StreamReader sr = new StreamReader( tempfile ) )
					{
						float.TryParse( sr.ReadToEnd( ).Trim( ), out currentvalue );
					}
				}
				catch ( IOException )
				{
					// ignore file-in-use errors
				}
			}
			int progress = (int)( 100F * ( currentvalue - min ) / range );
			if ( debug )
			{
				labeldescription.Text = string.Format( "Value:\t{0}\nProgress:\t{1}%\n", currentvalue, progress );
			}
			progressbar.Value = (int)currentvalue;
			progressbar.Refresh( );
			dialog.Refresh( );
		}


		delegate void UpdateValueDelegate( );


		static void UpdateValueThread( )
		{
			if ( dialog.InvokeRequired )
			{
				UpdateValueDelegate uvd = new UpdateValueDelegate( UpdateValue );
				try
				{
					dialog.Invoke( uvd );
				}
				catch
				{
					// ignore error while closing
				}
			}
			else
			{
				UpdateValue( );
			}
		}
	}
}