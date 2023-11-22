Sub RefreshIndiceNTable()
    '
    ' RefreshIndiceNTable Macro
    '

    '
    ActiveWorkbook.Connections("Query - Status").Refresh
    ActiveWorkbook.Connections("Query - mTable_Load").Refresh
    ActiveWorkbook.Connections("Query - Chart_1Y").Refresh
    ActiveWorkbook.Connections("Query - Chart_5Y").Refresh
    ActiveWorkbook.Connections("Query - Chart_Curve").Refresh
    ActiveWorkbook.Connections("Query - Chart_CNYCNHSPD").Refresh
    ActiveWorkbook.Connections("Query - OMAS").Refresh

End Sub
Sub RefreshDeal()
    '
    ' RefreshDeal Macro
    '

    '
    ActiveWorkbook.Connections("Query - USDCNH_Pie").Refresh
    ActiveWorkbook.Connections("Query - Recent60").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Tighten_3M").Refresh
    ActiveWorkbook.Connections("Query - Recent_ByWeek").Refresh


End Sub
Sub RefreshECONnWriter()
    '
    ' RefreshECONnWriter Macro
    '

    '
    ActiveWorkbook.Connections("Query - wECON").Refresh
    ActiveWorkbook.Connections("Query - wFuture").Refresh
    ActiveWorkbook.Connections("Query - Writer_Table").Refresh
    ActiveWorkbook.Connections("Query - wCompare").Refresh
    ActiveWorkbook.Connections("Query - wDealWriter").Refresh


End Sub