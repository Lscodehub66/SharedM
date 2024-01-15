Attribute VB_Name = "Module2"

Sub AutoCopy()
    '
    ' Macro3 Macro
    '

    '
    Application.Goto Reference:="ForReview_wCurated"
    Selection.Copy

    Dim name As Range
    Set name = Range("Name")
    Sheets(name.Value).Select

    Range("P4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False
    Application.CutCopyMode = False

    Application.Goto Reference:="ForReview_wBOCOM"
    Selection.Copy
    Sheets(name.Value).Select
    Range("AN4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False
    Application.CutCopyMode = False

    Application.Goto Reference:="ForReview_wCredit"
    Selection.Copy
    Sheets(name.Value).Select
    Range("BF4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False
    Application.CutCopyMode = False

    Application.Goto Reference:="ForReview_Issuer"
    Selection.Copy
    Sheets(name.Value).Select
    Range("A4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False
    Application.CutCopyMode = False


End Sub
