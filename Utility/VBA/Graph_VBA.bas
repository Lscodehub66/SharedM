Sub Refresh_EconNNews()
    '
    ' Refresh_EconNNews Macro
    '

    '
    ActiveWorkbook.Connections("Query - ControllerTP").Refresh
    ActiveWorkbook.Connections("Query - dd_Updator").Refresh
    ActiveWorkbook.Connections("Query - dd_DimMonday").Refresh
    ActiveWorkbook.Connections("Query - wEcon").Refresh
    ActiveWorkbook.Connections("Query - wFuture").Refresh
    ActiveWorkbook.Connections("Query - wNews").Refresh

End Sub

Sub Refresh_Indice()
    '
    ' Refresh_Indice Macro
    '

    '

    ActiveWorkbook.Connections("Query - Indice_Table").Refresh
    ActiveWorkbook.Connections("Query - Chart_1Y").Refresh
    ActiveWorkbook.Connections("Query - Chart_5Y").Refresh
    ActiveWorkbook.Connections("Query - Chart_Curve").Refresh
    ActiveWorkbook.Connections("Query - Chart_Curve2").Refresh
    ActiveWorkbook.Connections("Query - Chart_CNYCNHSPD").Refresh
    ActiveWorkbook.Connections("Query - Table_RMBEstimate").Refresh

End Sub
Sub Refresh_Deal()
    '
    ' Refresh_Deal Macro
    '

    '
    ActiveWorkbook.Connections("Query - USDCNH_Pie").Refresh
    ActiveWorkbook.Connections("Query - CNH_Pie").Refresh
    ActiveWorkbook.Connections("Query - DimSum_Pie").Refresh
    ActiveWorkbook.Connections("Query - SBLC_Pie_Size").Refresh
    ActiveWorkbook.Connections("Query - SBLC_Pie_SizeNYr").Refresh
    ActiveWorkbook.Connections("Query - SBLC_Pie_Count").Refresh
    ActiveWorkbook.Connections("Query - SBLC_HasRtg").Refresh
    ActiveWorkbook.Connections("Query - SBLCBankLEAG").Refresh
    ActiveWorkbook.Connections("Query - DimSum60").Refresh
    ActiveWorkbook.Connections("Query - SBLC60").Refresh
    ActiveWorkbook.Connections("Query - SBLC_Bank").Refresh
    ActiveWorkbook.Connections("Query - Recent60").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Tighten").Refresh


End Sub
Sub Refresh_Writer()
    '
    ' Refresh_Writer Macro
    '
    ActiveWorkbook.Connections("Query - Writers").Refresh
    ActiveWorkbook.Connections("Query - wNIMSum_Load").Refresh



End Sub

