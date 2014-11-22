VERSION 5.00
Begin VB.Form F_Minimap 
   Caption         =   "Minimap"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
End
Attribute VB_Name = "F_Minimap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
F_Minimap.Width = MiniMap_Width
F_Minimap.Height = MiniMAp_Height
F_Minimap.Left = main.Width - F_Minimap.Width - 200
F_Minimap.Top = 0
End Sub

