
Sub paste()

    Sheet12.Select
    Range("A2:DB419").Select
    Selection.Copy
    Sheet7.Select
    Range("A2").Select
    Selection.PasteSpecial paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False

    Sheet11.Select
    Range("A17:AU50").Select
    Selection.Copy
    Sheet8.Select
    Range("A3").Select
    Selection.Insert Shift:=xlDown
    Selection.PasteSpecial paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False

    Sheet9.Select
    Range("tbl_coded").Select
    Selection.Copy
    Sheet6.Select
    Range("A3").Select
    Selection.PasteSpecial paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
    :=False, Transpose:=False


End Sub


