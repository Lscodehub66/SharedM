VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} EXE_Directory 
   Caption         =   "EXE"
   ClientHeight    =   3630
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7800
   OleObjectBlob   =   "EXE_Directory.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "EXE_Directory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmdCopyFitSync_Click()
Unload Me
Call tblUpdator
End Sub

Private Sub CommandButton1_Click()

Dim wSheet As Worksheet
Password = "dcmexe"

    On Error Resume Next
    For Each wSheet In Worksheets
        If wSheet.ProtectContents = False Then
            wSheet.Protect Password:=Password, _
                AllowFiltering:=True, _
                AllowFormattingColumns:=True, _
                AllowFormattingRows:=False
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
EnterPwd_Directory.Show
End Sub

Private Sub CommandButton3_Click()
Call AutoFitColumn
End Sub

Private Sub CommandButton4_Click()
Unload Me
 Load EnterPwd_Directory
    
    EnterPwd_Directory.CheckBox_Refresh.Value = True
    
EnterPwd_Directory.Show

End Sub

Private Sub CommandButton5_Click()
If ActiveSheet.ProtectContents = True Then
Load EnterPwd_Directory
    
    EnterPwd_Directory.CheckBox_Refresh.Value = False
    
EnterPwd_Directory.Show
End If
Call SelectRange
Unload Me
End Sub

Private Sub Label1_Click()

End Sub



Private Sub ToggleOFF_Click()
Range("SWITCH") = "OFF"
Unload Me
MsgBox "BOCOM Highlight - " & Range("SWITCH")
End Sub

Private Sub ToggleON_Click()
Range("SWITCH") = "ON"
Unload Me
MsgBox "BOCOM Highlight - " & Range("SWITCH")

End Sub

Private Sub UserForm_Click()

End Sub


