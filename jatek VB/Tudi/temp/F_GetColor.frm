VERSION 5.00
Begin VB.Form F_GetColor 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "GetColor"
   ClientHeight    =   1245
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   1875
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1245
   ScaleWidth      =   1875
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox P_Color 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      FillStyle       =   0  'Solid
      Height          =   285
      Left            =   1440
      ScaleHeight     =   19
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   30
      TabIndex        =   9
      Top             =   765
      Width           =   450
      Begin VB.Label Label8 
         Caption         =   "Label8"
         Height          =   45
         Left            =   105
         TabIndex        =   13
         Top             =   -30
         Width           =   405
      End
      Begin VB.Label Label7 
         Caption         =   "Label7"
         Height          =   30
         Left            =   0
         TabIndex        =   12
         Top             =   -15
         Width           =   510
      End
   End
   Begin VB.CommandButton B_Ok 
      Caption         =   "Ok"
      Height          =   225
      Left            =   -15
      TabIndex        =   6
      Top             =   1050
      Width           =   1905
   End
   Begin VB.HScrollBar ScrollB 
      Height          =   240
      LargeChange     =   10
      Left            =   240
      Max             =   255
      TabIndex        =   2
      Top             =   540
      Width           =   1200
   End
   Begin VB.HScrollBar ScrollG 
      Height          =   255
      LargeChange     =   10
      Left            =   240
      Max             =   255
      TabIndex        =   1
      Top             =   285
      Width           =   1200
   End
   Begin VB.HScrollBar ScrollR 
      Height          =   285
      LargeChange     =   10
      Left            =   240
      Max             =   255
      TabIndex        =   0
      Top             =   0
      Width           =   1200
   End
   Begin VB.Label L_B 
      Height          =   225
      Left            =   1485
      TabIndex        =   14
      Top             =   540
      Width           =   405
   End
   Begin VB.Label L_G 
      Height          =   240
      Left            =   1485
      TabIndex        =   11
      Top             =   285
      Width           =   405
   End
   Begin VB.Label L_R 
      Height          =   285
      Left            =   1500
      TabIndex        =   10
      Top             =   0
      Width           =   375
   End
   Begin VB.Label l_Color 
      Height          =   270
      Left            =   525
      TabIndex        =   8
      Top             =   780
      Width           =   915
   End
   Begin VB.Label Label4 
      Caption         =   "Color : "
      Height          =   270
      Left            =   0
      TabIndex        =   7
      Top             =   780
      Width           =   525
   End
   Begin VB.Label Label3 
      Caption         =   "B"
      Height          =   240
      Left            =   0
      TabIndex        =   5
      Top             =   540
      Width           =   240
   End
   Begin VB.Label Label2 
      Caption         =   "G"
      Height          =   270
      Left            =   -15
      TabIndex        =   4
      Top             =   270
      Width           =   270
   End
   Begin VB.Label Label1 
      Caption         =   "R"
      Height          =   270
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   255
   End
End
Attribute VB_Name = "F_GetColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub B_ok_Click()
  VBrush(SelectedBrush).R = ScrollR
  VBrush(SelectedBrush).G = ScrollG
  VBrush(SelectedBrush).B = ScrollB
  l_Color.Caption = RGB(ScrollR, ScrollG, ScrollB)
  P_Color.BackColor = RGB(ScrollR, ScrollG, ScrollB)
  P_Color.Cls
End Sub

Private Sub ScrollR_Change()
  L_R.Caption = ScrollR.Value
'  VBrush(SelectedBrush).reserved = ScrollR.Value
End Sub

Private Sub Scrollg_Change()
  L_G.Caption = ScrollG.Value
End Sub

Private Sub Scrollb_Change()
  L_B.Caption = ScrollB.Value
End Sub

