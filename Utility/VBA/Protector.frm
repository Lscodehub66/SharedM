VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Protector 
   Caption         =   "Protector"
   ClientHeight    =   1590
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   OleObjectBlob   =   "Protector.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Protector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CommandButton1_Click()

Dim wSheet As Worksheet
Password = "dcmexe"

    On Error Resume Next
    For Each wSheet In Worksheets
        If wSheet.ProtectContents = False Then
            wSheet.Protect Password:=Password, _
                AllowFiltering:=True, _
                AllowFormattingColumns:=True, _
                AllowFormattingRows:=True
        End If
    Next wSheet
    If Err <> 0 Then
        MsgBox "You have entered an incorrect password. All worksheets could not " & _
        "be unprotected.", vbCritical, "Incorrect Password"
        Else
        MsgBox "All Sheets are protected", vbOKOnly, "DONE"
        End If
    On Error GoTo 0
    Unload Me
End Sub

Private Sub CommandButton2_Click()
EnterPwdToUnprotect.Show
End Sub
