VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "Protect / Unprotect ALL Worksheets"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7440
   OleObjectBlob   =   "UserForm2.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub CheckBox6_Click()

End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdProtect_BeforeDragOver(ByVal Cancel As MSForms.ReturnBoolean, ByVal Data As MSForms.DataObject, ByVal X As Single, ByVal Y As Single, ByVal DragState As MSForms.fmDragState, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Private Sub cmdProtect_BeforeDropOrPaste(ByVal Cancel As MSForms.ReturnBoolean, ByVal Action As MSForms.fmAction, ByVal Data As MSForms.DataObject, ByVal X As Single, ByVal Y As Single, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Private Sub cmdProtect_Click()
Dim wSheet As Worksheet

    On Error Resume Next
    For Each wSheet In Worksheets
        If wSheet.ProtectContents = True Then
            wSheet.Unprotect Password:=txtPwd.Text
    Else
            wSheet.Protect Password:=txtPwd.Text, _
                DrawingObjects:=CheckBox1.Enabled, _
                Contents:=CheckBox2.Enabled, _
                Scenarios:=CheckBox3.Enabled, _
                AllowFiltering:=True, _
                AllowFormattingColumns:=CheckBox5.Enabled, _
                AllowFormattingRows:=CheckBox6.Enabled
        End If
    Next wSheet
    If Err <> 0 Then
        MsgBox "You have entered an incorrect password. All worksheets could not " & _
        "be unprotected.", vbCritical, "Incorrect Password"
        End If
    On Error GoTo 0
    Unload Me
End Sub

Private Sub cmdProtect_Enter()

End Sub

Private Sub Label5_Click()

End Sub

Private Sub txtPwd_Change()

End Sub

Private Sub UserForm_Click()

End Sub
