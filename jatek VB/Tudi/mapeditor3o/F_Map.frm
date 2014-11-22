VERSION 5.00
Begin VB.Form F_Map 
   BorderStyle     =   0  'None
   Caption         =   "Map"
   ClientHeight    =   3270
   ClientLeft      =   0
   ClientTop       =   105
   ClientWidth     =   3435
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   218
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   229
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   40
      Left            =   1380
      Top             =   1215
   End
End
Attribute VB_Name = "F_Map"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
 Case K_Right
  cx1 = cx1 + Inc_SizeX
  If cx1 + F_Map.ScaleWidth > MHeader.x * BrushWidth Then cx1 = MHeader.x * BrushWidth - F_Map.ScaleWidth
  If MHeader.x <= VisibleBrushWidth Then cx1 = 0
  RefreshMap
  '
 Case K_Down
  cy1 = cy1 + Inc_SizeY
  If cy1 + F_Map.ScaleHeight > MHeader.y * BrushHeight Then cy1 = MHeader.y * BrushHeight - F_Map.ScaleHeight
  If MHeader.y <= VisibleBrushHeight Then cy1 = 0
  RefreshMap
  '
 Case K_Left
  cx1 = cx1 - Inc_SizeX
  If cx1 < 0 Then cx1 = 0
  RefreshMap
  '
 Case K_Up
  cy1 = cy1 - Inc_SizeY
  If cy1 < 0 Then cy1 = 0
  RefreshMap
 Case K_R
  RefreshMap
  '
 End Select
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = vbRightButton Then Me.SetFocus
  If Button = vbLeftButton Then MMap(Int((y + cy1) / BrushHeight) + 1, Int((x + cx1) / BrushWidth) + 1) = SelectedBrush
  If Button = vbRightButton Then
    SelectedBrush = MMap(Int((y + cy1) / BrushHeight) + 1, Int((x + cx1) / BrushWidth) + 1)
    F_SelectBrush.L_KurensBrush.Caption = Str(SelectedBrush)
    RefreshProperties
    RefreshSelectColor
  End If
  RefreshMap
  
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = vbLeftButton Then
 MMap(Int((y + cy1) / BrushHeight) + 1, Int((x + cx1) / BrushWidth) + 1) = SelectedBrush
 RefreshMap
 
End If
End Sub

Private Sub Timer1_Timer()
 kep.SetBrushesNextFrame (1)
  If (F_Main.M_Animate.Checked = True) Then RefreshMap
End Sub
