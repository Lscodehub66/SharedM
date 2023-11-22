Private Sub Worksheet_Change(Byval Target As Range)
    Dim KeyCells As Range

    ' The variable KeyCells contains the cells that will
    ' cause an alert when they are changed.
    Set KeyCells = Range("C5")

    If Not Application.Intersect(KeyCells, Range(Target.Address)) _
        Is Nothing Then

        ' Display a message when one of the designated cells has been
        ' changed.
        ' Place your code here.

        Sheet6.Activate
        Application.Goto Reference:="tbl_review_issuer"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review_BISL"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review_shortname"
        Selection.ClearContents

        Sheet9.Activate
        Application.Goto Reference:="input_econ"
        Selection.ClearContents
        Application.Goto Reference:="ECON"
        Selection.ClearContents

        Sheet8.Activate
        Application.Goto Reference:="input_future"
        Selection.ClearContents
        Application.Goto Reference:="FUTURE"
        Selection.ClearContents

        Sheet1.Activate
        Application.Goto Reference:="LastCharts"
        Selection.ClearContents
        Application.Goto Reference:="charts"
        Selection.ClearContents
        Application.Goto Reference:="LastNIM"
        Selection.ClearContents
        Application.Goto Reference:="Table_graph_weeklydeal"
        Selection.ClearContents

        Sheet4.Activate
        Application.Goto Reference:="SmartWriter"
        Selection.ClearContents

        Sheet5.Activate
        Application.Goto Reference:="ForReview_Issuer"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wCurated"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wBOCOM"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wCredit"
        Selection.ClearContents

        Sheet3.Activate
        Application.Goto Reference:="DLD_Conso"
        Selection.ClearContents


        Sheets("DOWNLOAD").Select
        Range("A14").Select

    End If
End Sub

