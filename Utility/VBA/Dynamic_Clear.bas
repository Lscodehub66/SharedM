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
        Sheet3.Activate

        Application.Goto Reference:="DLD_QRC_23"
        Selection.ClearContents
        Application.Goto Reference:="DLD_Filter_Credit"
        Selection.ClearContents
        Application.Goto Reference:="DLD_Filter_Bond"
        Selection.ClearContents

        Sheet6.Activate
        Application.Goto Reference:="tbl_review_issuer"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review_BISL"
        Selection.ClearContents
        Application.Goto Reference:="tbl_review_shortname"
        Selection.ClearContents

        Sheet7.Activate
        Application.Goto Reference:="DLD_Conso"
        Selection.ClearContents


        Sheet1.Activate
        Application.Goto Reference:="ForReview_wBond"
        Selection.ClearContents

        Sheet8.Activate
        Application.Goto Reference:="ForReview_wIssue"
        Selection.ClearContents

        Sheet9.Activate
        Application.Goto Reference:="ForReview_wStats"
        Selection.ClearContents



        Sheet15.Activate
        Application.Goto Reference:="ForReview_wBOCOM"
        Selection.ClearContents

        Sheet14.Activate
        Application.Goto Reference:="ForReview_wCredit"
        Selection.ClearContents

        Sheet16.Activate
        Application.Goto Reference:="DLD_Filtered_Add"
        Selection.ClearContents

        Sheet17.Activate
        Application.Goto Reference:="wNews_Input_ToClear"
        Selection.ClearContents

        Sheet20.Activate
        Application.Goto Reference:="ForReview_wChart"
        Selection.ClearContents


        Sheet18.Activate
        Application.Goto Reference:="ISIN_Search"
        Selection.ClearContents
        Application.Goto Reference:="wAddTap"
        Selection.ClearContents
        Application.Goto Reference:="AddTapInput"
        Selection.ClearContents


        Sheets("DOWNLOAD").Select
        Range("C6").Select

    End If
End Sub



