Attribute VB_Name = "Module1"
Sub RefreshDownload()
    '
    ' RefreshDownload Macro
    '

    '
    ActiveWorkbook.Connections("Query - DLD_DMI").Refresh
    ActiveWorkbook.Connections("Query - DLD_BBG_Corp").Refresh
    ActiveWorkbook.Connections("Query - DLD_QRC_23").Refresh
    ActiveWorkbook.Connections("Query - DLD_Conso").Refresh
    ActiveWorkbook.Connections("Query - DMI_NewColumn").Refresh
    ActiveWorkbook.Connections("Query - DMI_ChangedColumn").Refresh
    ActiveWorkbook.Connections("Query - DMIHeaders").Refresh
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


