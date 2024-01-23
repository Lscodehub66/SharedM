Sub Macro2()

    Dim rngCell As Range
    Dim i As Long
    
    Application.ScreenUpdating = False
    
    For Each rngCell In Selection
        For i = 1 To Len(rngCell)
            rngCell.Characters(i, 1).Font.Name = IIf(Asc(Mid(rngCell, i, 1)) = 63, "Kaiti", "Arial")
        Next i
    Next rngCell
    
    Application.ScreenUpdating = True

End Sub