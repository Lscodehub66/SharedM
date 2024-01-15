Attribute VB_Name = "Directory_Module3"
Function fxBaseCopy(QrySheet As String, Qrytblname As String)
    
    Application.DisplayAlerts = False
    Dim Destblname  As String
    
    Destblname = "tbl_" & Qrytblname
    
    Sheets(QrySheet).Activate
    Range(Qrytblname).Select
    Selection.copy
    Application.Goto Reference:=Destblname
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                           :=False, Transpose:=False
    Application.CutCopyMode = False
    Application.DisplayAlerts = True
    
End Function
Sub ShowEXE()

   
   
    EXE_Directory.Show
If Range("SWITCH") = "OFF" Then
EXE_Directory.ToggleON.Visible = True
EXE_Directory.ToggleOFF.Visible = False
Else
EXE_Directory.ToggleON.Visible = False
EXE_Directory.ToggleOFF.Visible = True
End If
End Sub
Public Sub SelectRange()
    Dim aRange As Range

 
    On Error Resume Next 'go to the next line if the inputbox is nothing (X or Cancel)
    Set aRange = Application.InputBox(prompt:="Select a range of cells to copy and reformat the fonts", Type:=8, Title:="Arial+Kaiti Formatter")
    On Error GoTo 0 'resets the onerror action
    
    ' Display the result
    If aRange Is Nothing Then
        MsgBox "The range was cancelled"
    Else
    aRange.copy
    ActiveWorkbook.Sheets.Add
    Range("A1").Select
     Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                           :=False, Transpose:=False
Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, SkipBlanks _
                           :=False, Transpose:=False
Selection.Columns.Autofit
Call ArialKaiti
End If
    
End Sub




