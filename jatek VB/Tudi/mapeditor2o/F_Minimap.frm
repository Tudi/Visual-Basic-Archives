VERSION 5.00
Begin VB.Form F_Minimap 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Minimap"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   ShowInTaskbar   =   0   'False
End
Attribute VB_Name = "F_Minimap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  ReloadMiniMap
End Sub
