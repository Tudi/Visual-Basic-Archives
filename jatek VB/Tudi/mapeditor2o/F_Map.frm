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
      Left            =   1365
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
  If MHeader.x * BrushWidth - cx1 - Inc_Size >= VisibleBrushWidth * BrushWidth Then
    cx1 = cx1 + Inc_Size
    RefreshMap
  End If
 Case K_Down
  If MHeader.y * BrushHeight - cy1 - Inc_Size >= VisibleBrushHeight * BrushHeight Then
    cy1 = cy1 + Inc_Size
    RefreshMap
  End If
 Case K_Left
  If cx1 >= Inc_Size Then
    cx1 = cx1 - Inc_Size
    RefreshMap
  End If
 Case K_Up
  If cy1 >= Inc_Size Then
    cy1 = cy1 - Inc_Size
    RefreshMap
  End If
 Case K_R
  RefreshMap
End Select
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = vbRightButton Then Me.SetFocus
'  MsgBox Str(Int((x + cx1) / BrushWidth) + 1) + Str(Int((y + cy1) / BrushHeight) + 1)
  If Button = vbLeftButton Then MMap(Int((y + cy1) / BrushHeight) + 1, Int((x + cx1) / BrushWidth) + 1) = SelectedBrush
  If Button = vbRightButton Then
    SelectedBrush = MMap(Int((y + cy1) / BrushHeight) + 1, Int((x + cx1) / BrushWidth) + 1)
    F_SelectBrush.L_KurensBrush.Caption = Str(SelectedBrush)
  End If
  RefreshMap
End Sub

Private Sub Timer1_Timer()
 kep.SetBrushesNextFrame (1)
  If (F_Main.M_Animate.Checked = True) Then RefreshMap
End Sub
