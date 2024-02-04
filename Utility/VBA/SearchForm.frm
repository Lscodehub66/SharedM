VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} SearchForm 
   Caption         =   "Search Form"
   ClientHeight    =   5145
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8580.001
   OleObjectBlob   =   "SearchForm.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "SearchForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Written by Philip Treacy
' Display All Matches from Search in Userform ListBox
'
Dim FormEvents As Boolean

Private Sub ClearForm(Except As String)

' Clears the list box and text boxes EXCEPT the text box
' currently having data entered into it

    Select Case Except
    
        Case "FName"
            FormEvents = False
            LName.Value = ""
            Location.Value = ""
            Department.Value = ""
            Results.Clear
            FormEvents = True

        Case "LName"
            FormEvents = False
            FName.Value = ""
            Location.Value = ""
            Department.Value = ""
            Results.Clear
            FormEvents = True

        Case "Location"
            FormEvents = False
            FName.Value = ""
            LName.Value = ""
            Department.Value = ""
            Results.Clear
            FormEvents = True

        Case "Department"
            FormEvents = False
            FName.Value = ""
            LName.Value = ""
            Location.Value = ""
            Results.Clear
            FormEvents = True
        
        Case Else
            FormEvents = False
            FName.Value = ""
            LName.Value = ""
            Location.Value = ""
            Department.Value = ""
            Results.Clear
            FormEvents = True
            
        End Select

End Sub

Private Sub ClearBtn_Click()

    ClearForm ("")
    
End Sub

Private Sub CloseBtn_Click()
    
    Me.Hide

End Sub

Private Sub FName_Change()
    
    If FormEvents Then ClearForm ("FName")
    
End Sub

Private Sub LName_Change()
    
    If FormEvents Then ClearForm ("LName")
    
End Sub

Private Sub Location_Change()
    
    If FormEvents Then ClearForm ("Location")
    
End Sub

Private Sub Department_Change()
    
    If FormEvents Then ClearForm ("Department")
    
End Sub

Private Sub SearchBtn_Click()

    Dim SearchTerm As String
    Dim SearchColumn As String
    Dim RecordRange As Range
    Dim FirstAddress As String
    Dim FirstCell As Range
    Dim RowCount As Integer
    
    ' Display an error if no search term is entered
    If FName.Value = "" And LName.Value = "" And Location.Value = "" And Department.Value = "" Then
    
        MsgBox "No search term specified", vbCritical + vbOKOnly
        Exit Sub
    
    End If
    
    ' Work out what is being searched for
    If FName.Value <> "" Then
    
        SearchTerm = FName.Value
        SearchColumn = "FirstName"
        
    End If
    
    If LName.Value <> "" Then
    
        SearchTerm = LName.Value
        SearchColumn = "LastName"
        
    End If

    If Location.Value <> "" Then
    
        SearchTerm = Location.Value
        SearchColumn = "Location"
        
    End If

    If Department.Value <> "" Then
    
        SearchTerm = Department.Value
        SearchColumn = "Department"
        
    End If
    
    Results.Clear
    
        ' Only search in the relevant table column i.e. if somone is searching Location
        ' only search in the Location column
        With Range("Table1[" & SearchColumn & "]")

            ' Find the first match
            Set RecordRange = .Find(SearchTerm, LookIn:=xlValues)

            ' If a match has been found
            If Not RecordRange Is Nothing Then

                FirstAddress = RecordRange.Address
                RowCount = 0

                Do
                
                    ' Set the first cell in the row of the matching value
                    Set FirstCell = Range("A" & RecordRange.Row)
                    
                    ' Add matching record to List Box
                    Results.AddItem
                    Results.List(RowCount, 0) = FirstCell(1, 1)
                    Results.List(RowCount, 1) = FirstCell(1, 2)
                    Results.List(RowCount, 2) = FirstCell(1, 3)
                    Results.List(RowCount, 3) = FirstCell(1, 4)
                    RowCount = RowCount + 1
                    
                    ' Look for next match
                    Set RecordRange = .FindNext(RecordRange)

                    ' When no further matches are found, exit the sub
                    If RecordRange Is Nothing Then

                        Exit Sub

                    End If

                ' Keep looking while unique matches are found
                Loop While RecordRange.Address <> FirstAddress

            Else
            
                ' If you get here, no matches were found
                Results.AddItem
                Results.List(RowCount, 0) = "Nothing Found"
            
            End If

        End With

End Sub



Private Sub UserForm_Initialize()

    FormEvents = True

End Sub
