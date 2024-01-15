Attribute VB_Name = "Module2"

Sub ShowEXE()
   EXE.Show
End Sub
Sub AutoFitColumn()
Dim ws As Worksheet
Application.ScreenUpdating = False    'Optional
For Each ws In Worksheets
    ws.Activate
    ActiveWindow.Zoom = 85
Next
Application.ScreenUpdating = True



End Sub

Sub Autofit()

On Error Resume Next
Application.ScreenUpdating = False
Worksheets("DEAL DIRECTORY").Columns("B:AO").Autofit
Worksheets("ESG").Columns("A:Z").Autofit
Worksheets("DimSum").Columns("A:Z").Autofit
Worksheets("SBLC").Columns("A:Z").Autofit
Worksheets("FI").Columns("A:Z").Autofit
Worksheets("IG LGFV Non-CNH").Columns("A:Z").Autofit
Worksheets("RECENT All").Columns("A:Z").Autofit



End Sub



