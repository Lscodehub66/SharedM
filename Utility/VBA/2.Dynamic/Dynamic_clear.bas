Private Sub Worksheet_Change(Byval Target As Range)
    Dim KeyCells As Range
    Dim KeyCells2 As Range
    ' The variable KeyCells contains the cells that will
    ' cause an alert when they are changed.
    Set KeyCells = Range("C5")
    Set KeyCells2 = Range("C7")


    If Not Application.Intersect(KeyCells2, Range(Target.Address)) _
        Is Nothing And Not IsEmpty(Range("FridayRun")) Then

        Call RefreshSource
    Elseif Not Application.Intersect(KeyCells, Range(Target.Address)) _
        Is Nothing Then

        ' Display a message when one of the designated cells has been
        ' changed.
        ' Place your code here.

        Call BakcupCopy

        Sheet3.Activate
        Application.Goto Reference:="FridayRun"
        Selection.ClearContents

        Application.Goto Reference:="MondayRun"
        Selection.ClearContents

        Application.Goto Reference:="DMIHeaders_Check"
        Selection.ClearContents

        Sheet10.Activate
        Application.Goto Reference:="DLD_Filter_Credit"
        Selection.ClearContents
        Application.Goto Reference:="Conso_ToClear"
        Selection.ClearContents
        Application.Goto Reference:="Step2Button"
        Selection.ClearContents


        Worksheets("3_wBond").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select

        Worksheets("wIssue").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select  

        Worksheets("wStats").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select

        Worksheets("wBOCOM").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select

        Worksheets("wCredit").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select

        Worksheets("wChart").Activate
        ActiveSheet.Range("D6:Z60").Select
        Selection.ClearContents
        ActiveSheet.Range("B2").Select

        Sheet7.Activate
        Application.Goto Reference:="DLD_BBG_Corp"
        Selection.ClearContents


        Sheet13.Activate
        Application.Goto Reference:="DLD_DMI"
        Selection.ClearContents



        Sheet11.Activate
        Application.Goto Reference:="wNews_Input_ToClear"
        Selection.ClearContents



        Sheet16.Activate
        Application.Goto Reference:="Filtered_Add"
        Selection.ClearContents


        Sheet17.Activate
        Application.Goto Reference:="wConso"
        Selection.ClearContents


        Application.Goto Reference:="FinalButton"
        Selection.ClearContents


        Sheet3.Select
        Range("C6").Select

        Call RefreshSource

    End If
End Sub


