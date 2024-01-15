VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} EnterPwd_Directory 
   Caption         =   "Unprotect ALL Worksheets"
   ClientHeight    =   2145
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7440
   OleObjectBlob   =   "EnterPwd_Directory.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "EnterPwd_Directory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub CheckBox6_Click()

End Sub

Private Sub CheckBox1_Click()

End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub CheckBox_Refresh_Click()
If CheckBox_Refresh.Value = True Then
cmdRefresh.Visible = True
cmdProtect.Visible = False
Else
cmdRefresh.Visible = False
cmdProtect.Visible = True
End If
End Sub

Private Sub cmdProtect_BeforeDragOver(ByVal Cancel As MSForms.ReturnBoolean, ByVal Data As MSForms.DataObject, ByVal x As Single, ByVal y As Single, ByVal DragState As MSForms.fmDragState, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Private Sub cmdProtect_BeforeDropOrPaste(ByVal Cancel As MSForms.ReturnBoolean, ByVal Action As MSForms.fmAction, ByVal Data As MSForms.DataObject, ByVal x As Single, ByVal y As Single, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Private Sub cmdProtect_Click()
Dim wSheet As Worksheet


    On Error Resume Next
    For Each wSheet In Worksheets
        If wSheet.ProtectContents = True Then
            wSheet.Unprotect Password:=txtPwd.text
        End If
    Next wSheet
    If Err <> 0 Then
        MsgBox "Wrong Password entered. All worksheets could not " & _
        "be unprotected.", vbCritical, "Incorrect"
      Else
          MsgBox "All Sheets are now uprotected", vbOKOnly, "DONE"
        
                                          End If
    On Error GoTo 0
    Unload Me
End Sub

Private Sub cmdProtect_Enter()

End Sub

Private Sub Label5_Click()

End Sub

Private Sub Label2_Click()

End Sub

Private Sub cmdRefresh_Click()
Dim wSheet As Worksheet


    On Error Resume Next
    For Each wSheet In Worksheets
        If wSheet.ProtectContents = True Then
            wSheet.Unprotect Password:=txtPwd.text
        End If
    Next wSheet
    If Err <> 0 Then
        MsgBox "Wrong Password entered. All worksheets could not " & _
        "be unprotected.", vbCritical, "Incorrect"
        
          Else
         Result = MsgBox("All Sheets are now uprotected.Proceed to refresh?", vbYesNo, "Proceed?")
          End If
                      If Result = vbYes Then
                      Unload Me
                      ActiveWorkbook.RefreshAll
                        
                                          End If
    On Error GoTo 0
    Unload Me

End Sub

Private Sub txtPwd_Change()

End Sub

Private Sub UserForm_Click()

End Sub


