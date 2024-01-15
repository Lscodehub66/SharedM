Sub ShowStep1MsgBox()
    Dim msgBoxText As String
    Dim timeDelay As Double
    Dim msgBox As Object

    msgBoxText = "Step 1 Loading data frrom <1.Weekly Download.xlsx>"

    timeDelay = 5

    Set msgBox = CreateObject("WScript.Shell")
    msgBox.Popup msgBoxText, timeDelay, "Step1 Msg", vbInformation
End Sub

Sub ShowStep2MsgBox()
    Dim msgBoxText As String
    Dim timeDelay As Double
    Dim msgBox As Object

    msgBoxText = "Step 2 Loading. Filter and transform"

    timeDelay = 5

    Set msgBox = CreateObject("WScript.Shell")
    msgBox.Popup msgBoxText, timeDelay, "Step2 Msg", vbInformation
End Sub

Sub RefreshSource()
    '
    ' RefreshSource Macro
    '



    ActiveWorkbook.Connections("Query - DLD_BBG_Corp").Refresh
    ActiveWorkbook.Connections("Query - DLD_DMI").Refresh
    ActiveWorkbook.Connections("Query - DMIHeaders_Check").Refresh
    ActiveWorkbook.Connections("Query - DimMonday").Refresh
    ActiveWorkbook.Connections("Query - DLD_QRC_Income24").Refresh
    Call ShowStep1MsgBox


End Sub



Sub RefreshForFilter()
    '
    ' RefreshDownload Macro
    '

    ActiveWorkbook.Connections("Query - DMIHeaders").Refresh
    ActiveWorkbook.Connections("Query - DLD_Conso").Refresh
    ActiveWorkbook.Connections("Query - DLD_Filter_Credit").Refresh
    Call ShowStep2MsgBox

End Sub

Sub RefreshAdd()
    '
    ' RefreshDownload Macro
    '
    ActiveWorkbook.Connections("Query - Filtered_Add").Refresh


End Sub




Sub RefreshDLDForReview()
    '
    ' RefreshDLDForReview Macro
    '

    '
    Call CopyInCase
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













