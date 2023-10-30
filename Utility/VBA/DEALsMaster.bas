Sub RefreshDataLake()
    '
    ' RefreshDataLake Macro
    '


    ActiveWorkbook.Connections("Query - wDynamic").Refresh
    ActiveWorkbook.Connections("Query - wIndice").Refresh
    ActiveWorkbook.Connections("Query - ControllerTP").Refresh
    ActiveWorkbook.Connections("Query - BaseDirectory_CN").Refresh


    If Range("GPS") = "Global" Then
        ActiveWorkbook.Connections("Query - External_Sources").Refresh
        ActiveWorkbook.Connections("Query - ESG_ExternalReview").Refresh
        ActiveWorkbook.Connections("Query - KYC_Master").Refresh
        ActiveWorkbook.Connections("Query - CPL_23").Refresh
        ActiveWorkbook.Connections("Query - DLD_QRC_23").Refresh
    End If


End Sub
Sub RefreshFolderDatabase()
    '
    ' RefreshFolderDatabase Macro
    '

    '
    ActiveWorkbook.Connections("Query - Step2_RowCount").Refresh
    ActiveWorkbook.Connections("Query - mCurated").Refresh
    ActiveWorkbook.Connections("Query - mBISL").Refresh
    ActiveWorkbook.Connections("Query - mCredit").Refresh
    ActiveWorkbook.Connections("Query - mChart").Refresh
    ActiveWorkbook.Connections("Query - BISL_Ancient").Refresh
    ActiveWorkbook.Connections("Query - mIndice").Refresh

End Sub
Sub RefreshKeyGraphLoad()
    '
    ' RefreshKeyGraphLoad Macro
    '

    '

    ActiveWorkbook.Connections("Query - deal_master").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Data").Refresh
    ActiveWorkbook.Connections("Query - SBLCBankLEAG").Refresh


End Sub
Sub RefreshNewIssueMonitor()
    '
    ' Refresh4NewIssueMonitor Macro
    '

    '

    ActiveWorkbook.Connections("Query - SBLC").Refresh
    ActiveWorkbook.Connections("Query - DimSum").Refresh
    ActiveWorkbook.Connections("Query - ESG").Refresh
    ActiveWorkbook.Connections("Query - FI").Refresh
    ActiveWorkbook.Connections("Query - IGlgfv").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Tighten_3M").Refresh
End Sub
Sub RefreshDirectory()
    '
    ' RefreshDirectory Macro
    '

    '

    ActiveWorkbook.Connections("Query - Directory").Refresh

End Sub
Sub RefreshwTomb()
    '
    ' RefreshwTomb Macro
    '

    '

    ActiveWorkbook.Connections("Query - wTomb").Refresh
    ActiveWorkbook.Connections("Query - CompletedFormalities").Refresh

End Sub

