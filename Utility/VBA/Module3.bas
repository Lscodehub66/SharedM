Attribute VB_Name = "Module3"
Sub ShowStep1MsgBox()
   Dim msgBoxText As String
   Dim timeDelay As Double
   Dim msgBox As Object
    
   msgBoxText = "Loading data from <1.Weekly Download.xlsx>"
    
   timeDelay = 5
    
   Set msgBox = CreateObject("WScript.Shell")
   msgBox.Popup msgBoxText, timeDelay, "Step1 Msg", vbInformation
End Sub
