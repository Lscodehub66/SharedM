
Sub CopyIncase()
    Call Copytbl("wIssue")
    Call Copytbl("wStats")
    Call Copytbl("wCredit")
    Call Copytbl("wChart")
    Call Copytbl("wBOCOM")
    Call Copytbl("wBond")
End Sub
Function Copytbl(nameinput As String)




    Dim tblname As String
    Dim suffix As String
    Dim tbl As String
    Dim num As Integer



       If Not nameinput = "wNews_Input" Then tblname = "ForReview_" & nameinput Else tblname = nameinput
    suffix = "[#All]"
    tbl = tblname & suffix
    num = Range(tbl).Rows.Count + 4

    
    If Not IsEmpty(Range(tblname & "[Index]")) Then
    
    Application.ScreenUpdating = False

    Application.Goto Reference:=tbl
    Selection.Copy


    Selection.Offset(num, 0).Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False
    Application.CutCopyMode = False
    Selection.Font.Color = RGB(167, 167, 167)

    Range("A2").Select
End If

End Function





