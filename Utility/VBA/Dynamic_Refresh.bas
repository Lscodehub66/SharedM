Sub RefreshDownload()
    '
    ' RefreshDownload Macro
    '
    ActiveWorkbook.Connections("Query - DimMonday").Refresh
    ActiveWorkbook.Connections("Query - DMIHeaders_Check").Refresh
    ActiveWorkbook.Connections("Query - DMIHeaders").Refresh
    ActiveWorkbook.Connections("Query - DLD_Conso").Refresh
    ActiveWorkbook.Connections("Query - DLD_Filter_Credit").Refresh

End Sub
Sub RefreshDLDForReview()
    '
    ' RefreshDLDForReview Macro
    '

    '
    ActiveWorkbook.Connections("Query - Filtered_Add").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wIssue").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wBond").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wCredit").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wBOCOM").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wChart").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wStats").Refresh

End Sub

Sub RefreshISINSearch()
    '
    ' RefreshISINSearch Macro
    '

    '
    ActiveWorkbook.Connections("Query - ISIN_Search").Refresh


End Sub

Sub RefreshwAddTap()
    '
    ' RefreshwAddTap Macro
    '

    '
    ActiveWorkbook.Connections("Query - wAddTap").Refresh


End Sub

Sub RefreshAll()
    '
    ' RefreshAll Macro
    '

    '
    ActiveWorkbook.RefreshAll


End Sub









