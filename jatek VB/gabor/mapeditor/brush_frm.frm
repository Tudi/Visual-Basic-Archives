VERSION 5.00
Begin VB.Form brush_frm 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.Label Label2 
      Caption         =   "0/0"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Brush"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   495
   End
End
Attribute VB_Name = "brush_frm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Me.Top = MiniMAp_Height + 100
Me.Left = main.Width - F_Minimap.Width - 200
Me.Width = MiniMap_Width
Me.Height = 3000

End Sub
