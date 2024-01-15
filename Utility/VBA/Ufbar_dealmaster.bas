Attribute VB_Name = "Ufbar_dealmaster"


'PLACE IN STANDARD MODULE
Sub RefreshForGraph_Bar()
'(Step 1) Display your Progress Bar
ufProgress.LabelProgress.Width = 0
ufProgress.Show
   Application.CommandBars("Queries and Connections").Visible = True
FractionDES ("Now refreshing <chart_master>...")
FractionComplete (0) '(Step 2)
  
    'ActiveWorkbook.Connections("Query - chart_master").Refresh

    Call FnRefreshObj("3.master", "chart_master")
    '--------------------------------------
FractionDES ("<chart_master> done. Now refreshing deal_master...")
FractionComplete (0.1) '(Step 2)
    '--------------------------------------
    Call FnRefreshObj("3.master", "deal_master")
  
FractionDES ("<deal_master> done. Now refreshing <Directory>")
FractionComplete (0.7) '(Step 2)
    '--------------------------------------

Sheet15.Activate
Range("D8").Select
Sheets("DIRCTRY").ListObjects("Directory").QueryTable.Refresh False
 Application.Wait Now + #12:00:03 AM#
 
 
FractionDES ("<Directory> done. Lastly...Weekly Tombs...")
FractionComplete (0.85) '(Step 2)
    '--------------------------------------
  Sheet22.Activate
  Range("D8").Select
Sheets("CPL").ListObjects("CompletedFormalities").QueryTable.Refresh False
 Application.Wait Now + #12:00:03 AM#


      Call AutoRefreshwTomb
       Application.Wait Now + #12:00:03 AM#
    '--------------------------------------
FractionDES ("ALL DONE!!!")
FractionComplete (1) '(Step 2)

Sheets("3.master").Activate
  ActiveWindow.Zoom = 85
    Unload ufProgress

End Sub

Private Function FnRefreshObj(string1 As String, string2 As String)
Range(string2 & "[[#Headers],[Index]]").Offset(1, 0).Select
Sheets(string1).ListObjects(string2).QueryTable.Refresh False
 Application.Wait Now + #12:00:03 AM#
 End Function
 
 Private Sub FractionComplete(pctdone As Single)
With ufProgress
    '.LabelCaption.Caption = pctdone * 100 & "% Refreshed"
    .LabelProgress.Width = pctdone * (.FrameProgress.Width)

End With

DoEvents
End Sub
 Private Sub FractionDES(string1 As String)
With ufProgress
    .LabelDes.Caption = string1
End With
End Sub
