VERSION 5.00
Begin VB.Form F_Minimap 
   BorderStyle     =   0  'None
   Caption         =   "Minimap"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   1500
      Top             =   1620
   End
End
Attribute VB_Name = "F_Minimap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim px As Single
  Dim py As Single
  If Button = vbLeftButton Then
      If F_Minimap.ScaleWidth > MHeader.x Then
        px = F_Minimap.ScaleWidth / MHeader.x
        Else: px = 1
      End If
      If F_Minimap.ScaleHeight > MHeader.y Then
         py = F_Minimap.ScaleHeight / MHeader.y
         Else: py = 1
      End If
      cx1 = (x - VisibleBrushWidth / 2) * (px + 1.5)
      cy1 = (y - VisibleBrushHeight / 2) * (py + 1.5)
      If cx1 + F_Map.ScaleWidth > MHeader.x * BrushWidth Then cx1 = MHeader.x * BrushWidth - F_Map.ScaleWidth
      If cy1 + F_Map.ScaleHeight > MHeader.y * BrushHeight Then cy1 = MHeader.y * BrushHeight - F_Map.ScaleHeight
      If cx1 < 0 Then cx1 = 0
      If cy1 < 0 Then cy1 = 0
  End If
  
  RefreshMap
End Sub

Private Sub Timer1_Timer()
   RefreshMiniMap
End Sub
