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





        Sheet1.Activate
        Application.Goto Reference:="ForReview_wBond"
        Selection.ClearContents

        Application.Goto Reference:="Step3Button"
        Selection.ClearContents

        Sheet7.Activate
        Application.Goto Reference:="DLD_BBG_Corp"
        Selection.ClearContents


        Sheet13.Activate
        Application.Goto Reference:="DLD_DMI"
        Selection.ClearContents

        Sheet8.Activate
        Application.Goto Reference:="ForReview_wIssue"
        Selection.ClearContents

        Sheet9.Activate
        Application.Goto Reference:="ForReview_wStats"
        Selection.ClearContents

        Sheet11.Activate
        Application.Goto Reference:="wNews_Input_ToClear"
        Selection.ClearContents

        Sheet14.Activate
        Application.Goto Reference:="ForReview_wCredit"
        Selection.ClearContents


        Sheet15.Activate
        Application.Goto Reference:="ForReview_wBOCOM"
        Selection.ClearContents

        Sheet16.Activate
        Application.Goto Reference:="Filtered_Add"
        Selection.ClearContents


        Sheet17.Activate
        Application.Goto Reference:="wConso"
        Selection.ClearContents


        Application.Goto Reference:="FinalButton"
        Selection.ClearContents

        Sheet20.Activate
        Application.Goto Reference:="ForReview_wChart"
        Selection.ClearContents

        Sheet3.Select
        Range("C6").Select

        Call RefreshSource

    End If
End Sub
