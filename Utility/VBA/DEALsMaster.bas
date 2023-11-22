Sub RefreshDataLake()
    '
    ' RefreshDataLake Macro
    '

    '
    ActiveWorkbook.Connections("Query - External_Sources").Refresh
    ActiveWorkbook.Connections("Query - wDynamic").Refresh
    ActiveWorkbook.Connections("Query - wIndice").Refresh
    ActiveWorkbook.Connections("Query - Status").Refresh
    ActiveWorkbook.Connections("Query - ESG_ExternalReview").Refresh
    ActiveWorkbook.Connections("Query - BaseDirectory_CN").Refresh
    ActiveWorkbook.Connections("Query - KYC_Load").Refresh
    ActiveWorkbook.Connections("Query - CPL_23").Refresh
End Sub
Sub RefreshFolderDatabase()
    '
    ' RefreshFolderDatabase Macro
    '

    '
    ActiveWorkbook.Connections("Query - Count").Refresh
    ActiveWorkbook.Connections("Query - mCurated").Refresh
    ActiveWorkbook.Connections("Query - mBISL").Refresh
    ActiveWorkbook.Connections("Query - mCredit").Refresh
    ActiveWorkbook.Connections("Query - mChart").Refresh
    ActiveWorkbook.Connections("Query - AncientDirectory").Refresh
    ActiveWorkbook.Connections("Query - mIndice").Refresh

End Sub
Sub RefreshKeyGraphLoad()
    '
    ' RefreshKeyGraphLoad Macro
    '

    '
    ActiveWorkbook.Connections("Query - deal_master").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Pie_Data").Refresh
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

End Sub


