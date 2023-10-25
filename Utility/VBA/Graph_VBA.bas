Sub Refresh_EconNNews()
    '
    ' Refresh_EconNNews Macro
    '

    '
    ActiveWorkbook.Connections("Query - Status").Refresh
    ActiveWorkbook.Connections("Query - wECON").Refresh
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
    ActiveWorkbook.Connections("Query - Chart_CNYCNHSPD").Refresh
    ActiveWorkbook.Connections("Query - Table_RMBEstimate").Refresh
    ActiveWorkbook.Connections("Query - OMAS").Refresh

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
    ActiveWorkbook.Connections("Query - Recent60").Refresh
    ActiveWorkbook.Connections("Query - USDCNH_Tighten_3M").Refresh


End Sub
Sub Refresh_Writer()
    '
    ' Refresh_Writer Macro
    '
    ActiveWorkbook.Connections("Query - Writers").Refresh
    ActiveWorkbook.Connections("Query - wNewIssue_Sum").Refresh
  


End Sub