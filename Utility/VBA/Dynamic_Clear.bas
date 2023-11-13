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


        Sheet5.Activate
        Application.Goto Reference:="ForReview_Issuer"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wCurated"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wBOCOM"
        Selection.ClearContents
        Application.Goto Reference:="ForReview_wCredit"
        Selection.ClearContents

        Sheet17.Activate
        Application.Goto Reference:="wNews_Input_ToClear"
        Selection.ClearContents

        Sheet3.Activate
        Application.Goto Reference:="DLD_Conso"
        Selection.ClearContents
        Application.Goto Reference:="DLD_QRC_23"
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

