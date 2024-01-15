Attribute VB_Name = "Directory_Module2"

Option Explicit

Function fxtblUpdator(copy As Boolean, QuerySheet As String, Querytbl As String, Optional Align As String, Optional AutoFitCol As Boolean)
    If copy = True Then
        Call fxBaseCopy(QuerySheet, Querytbl)
    End If
    
    Dim table1      As ListObject
    Dim table2      As ListObject
    Dim destinationSheet As String
    Dim destinationTbl As String
    destinationSheet = Querytbl
    destinationTbl = "tbl_" & Querytbl
    
    Set table1 = ThisWorkbook.Sheets(destinationSheet).ListObjects(destinationTbl)
    Set table2 = ThisWorkbook.Sheets(QuerySheet).ListObjects(Querytbl)
    
    Dim rows_count  As Long
    Dim columns_count As Long
    
    Dim x           As String
    Dim y           As String
  
    With table2
        rows_count = .Range.Rows.Count
        
    End With
    
    With table1
        columns_count = .Range.Columns.Count
        x = .Range.Cells(1, 1).Address
        y = .Range.Cells(rows_count, columns_count).Address
        .Resize Range(x & ":" & y)
    End With
    If Align = "Left" Then
        Application.Goto Reference:=Range(destinationTbl & "[#All]")
        Selection.HorizontalAlignment = xlLeft
    ElseIf Align = "Right" Then
        Application.Goto Reference:=Range(destinationTbl & "[#All]")
        Selection.HorizontalAlignment = xlRight
    ElseIf Align = "Center" Then
        Application.Goto Reference:=Range(destinationTbl & "[#All]")
        Selection.HorizontalAlignment = xlCenter
    End If
    If AutoFitCol <> True Then
        Range(destinationTbl & "[#All]").Columns.Autofit
    End If
    Range("A1").Select
    MsgBox "< " & Querytbl & " > updated."
End Function

Sub tblUpdator()
    
    Call fxtblUpdator(True, "load", "Directory", "Center")
    Call fxtblUpdator(True, "load2", "FI", "Center")
    Call fxtblUpdator(True, "load2", "IGlgfv", "Center")
    Call fxtblUpdator(True, "load2", "DimSum", "Center")
    Call fxtblUpdator(True, "load2", "SBLC", "Center")
    Call fxtblUpdator(True, "load2", "ESG", "Center")
    Call fxtblUpdator(True, "load2", "Recent", "Center")
    
End Sub

Function FitColA1(sheetname As String, ColRange As String)
    Application.ScreenUpdating = False
    Worksheets(sheetname).Activate
    Worksheets(sheetname).Columns(ColRange).Autofit
    Range("A1").Select
    
End Function

Function WaitSecond(num As Integer)
    Dim newHour     As Integer
    Dim newMinute   As Integer
    Dim newSecond   As Integer
    Dim waitTime
    newHour = Hour(Now())
    newMinute = Minute(Now())
    newSecond = Second(Now()) + num
    waitTime = TimeSerial(newHour, newMinute, newSecond)
    Application.Wait waitTime
End Function
Sub ArialKaiti()
    
    Dim rngCell     As Range
    Dim i           As Long
    
    Application.ScreenUpdating = False
    
    For Each rngCell In Selection
        For i = 1 To Len(rngCell)
            rngCell.Characters(i, 1).Font.name = IIf(Asc(Mid(rngCell, i, 1)) = 63, "Kaiti", "Arial")
        Next i
    Next rngCell
    
    Application.ScreenUpdating = True
    
End Sub

