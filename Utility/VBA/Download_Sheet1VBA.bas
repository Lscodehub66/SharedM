Private Sub Worksheet_Change(ByVal Target As Range)
    Dim KeyCells As Range

    ' The variable KeyCells contains the cells that will
    ' cause an alert when they are changed.
    Set KeyCells = Range("F2")

    If Not Application.Intersect(KeyCells, Range(Target.Address)) _
        Is Nothing Then

        ' Display a message when one of the designated cells has been
        ' changed.
        ' Place your code here.

        Sheet2.Activate
        ActiveSheet.Range("A3:CA70").Select
        Selection.ClearContents

        Sheet15.Activate
        ActiveSheet.Range("C3:CA150").Select
        Selection.ClearContents

        Sheet16.Activate
        ActiveSheet.Range("A3:CA70").Select
        Selection.ClearContents

        Sheet10.Activate
        ActiveSheet.Range("A3:BQ400").Select
        Selection.ClearContents

        Sheet5.Activate
        ActiveSheet.Range("F4:F400").Select
        Selection.ClearContents

        Sheet6.Activate
        ActiveSheet.Range("A3:BO400").Select
        Selection.ClearContents

        Sheet7.Activate
        ActiveSheet.Range("A2:BE419").Select
        Selection.ClearContents

        Sheet8.Activate
        ActiveSheet.Range("A3:BC50").Select
        Selection.ClearContents

        Sheet4.Activate
        ActiveSheet.Range("A3:L200").Select
        Selection.ClearContents

        Sheet1.Activate



    End If

End Sub





