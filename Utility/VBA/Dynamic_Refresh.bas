Sub RefreshDownload()
    '
    ' RefreshDownload Macro
    '

    '
    ActiveWorkbook.Connections("Query - DimMonday").Refresh
    ActiveWorkbook.Connections("Query - CSOE_SASAC").Refresh
    ActiveWorkbook.Connections("Query - DLD_Conso").Refresh
    ActiveWorkbook.Connections("Query - DMI_NewColumn").Refresh
    ActiveWorkbook.Connections("Query - DMI_ChangedColumn").Refresh
    ActiveWorkbook.Connections("Query - DMIHeaders").Refresh

    If Range("GPS") = "Global" Then
        ActiveWorkbook.Connections("Query - DLD_QRC_23").Refresh

    End If
End Sub



Sub RefreshDLDForReview()
    '
    ' RefreshDLDForReview Macro
    '

    '
    ActiveWorkbook.Connections("Query - DLD_Add").Refresh
    ActiveWorkbook.Connections("Query - ForReview_Issuer").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wCurated").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wCredit").Refresh
    ActiveWorkbook.Connections("Query - ForReview_wBOCOM").Refresh

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



