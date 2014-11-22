VERSION 5.00
Begin VB.Form F_BProp 
   BorderStyle     =   0  'None
   Caption         =   "Properties"
   ClientHeight    =   4335
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4650
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   4335
   ScaleWidth      =   4650
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text11 
      Height          =   300
      Left            =   2145
      TabIndex        =   21
      Top             =   2685
      Width           =   975
   End
   Begin VB.TextBox Text10 
      Height          =   285
      Left            =   2145
      TabIndex        =   20
      Top             =   2415
      Width           =   975
   End
   Begin VB.TextBox Text9 
      Height          =   285
      Left            =   2145
      TabIndex        =   19
      Top             =   2145
      Width           =   975
   End
   Begin VB.TextBox Text8 
      Height          =   285
      Left            =   2145
      TabIndex        =   15
      Top             =   1875
      Width           =   975
   End
   Begin VB.TextBox Text7 
      Height          =   285
      Left            =   2145
      TabIndex        =   14
      Top             =   1605
      Width           =   975
   End
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   2145
      TabIndex        =   13
      Top             =   1335
      Width           =   975
   End
   Begin VB.TextBox Text5 
      Height          =   300
      Left            =   2145
      TabIndex        =   12
      Top             =   1065
      Width           =   975
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   2145
      TabIndex        =   7
      Top             =   810
      Width           =   975
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   2145
      TabIndex        =   5
      Top             =   540
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2145
      TabIndex        =   3
      Top             =   270
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   300
      Left            =   2145
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
   Begin VB.Label Label11 
      Caption         =   "   Hides units ?"
      Height          =   270
      Left            =   180
      TabIndex        =   18
      Top             =   2715
      Width           =   1965
   End
   Begin VB.Label Label10 
      Caption         =   "   + Weapon Range"
      Height          =   270
      Left            =   180
      TabIndex        =   17
      Top             =   2445
      Width           =   1980
   End
   Begin VB.Label Label9 
      Caption         =   "   +Sight range"
      Height          =   240
      Left            =   180
      TabIndex        =   16
      Top             =   2205
      Width           =   2025
   End
   Begin VB.Label Label8 
      Caption         =   "   + Speed"
      Height          =   300
      Left            =   180
      TabIndex        =   11
      Top             =   1905
      Width           =   1980
   End
   Begin VB.Label Label7 
      Caption         =   "   + Damage "
      Height          =   270
      Left            =   180
      TabIndex        =   10
      Top             =   1635
      Width           =   1995
   End
   Begin VB.Label Label6 
      Caption         =   "   + Defense"
      Height          =   270
      Left            =   180
      TabIndex        =   9
      Top             =   1365
      Width           =   1980
   End
   Begin VB.Label Label5 
      Caption         =   "   Can build on it ?"
      Height          =   285
      Left            =   165
      TabIndex        =   8
      Top             =   1080
      Width           =   1995
   End
   Begin VB.Label Label4 
      Caption         =   "   Elevation height"
      Height          =   270
      Left            =   150
      TabIndex        =   6
      Top             =   810
      Width           =   1980
   End
   Begin VB.Label Label3 
      Caption         =   "   Crosabble by boat ?"
      Height          =   330
      Left            =   150
      TabIndex        =   4
      Top             =   570
      Width           =   1995
   End
   Begin VB.Label Label2 
      Caption         =   "   Crossable by plane ?"
      Height          =   255
      Left            =   165
      TabIndex        =   2
      Top             =   300
      Width           =   1980
   End
   Begin VB.Label Label1 
      Caption         =   "   Crossable by foot ?"
      Height          =   270
      Left            =   180
      TabIndex        =   1
      Top             =   30
      Width           =   1965
   End
End
Attribute VB_Name = "F_BProp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Text1_Change()
  VBrush(SelectedBrush).CanMove = Int(Text1.Text)
End Sub

Private Sub Text2_Change()
  VBrush(SelectedBrush).CanFly = Int(Text2.Text)
End Sub

Private Sub Text3_Change()
  VBrush(SelectedBrush).CanSwim = Int(Text3.Text)
End Sub

Private Sub Text4_Change()
  VBrush(SelectedBrush).Height = Int(Text4.Text)
End Sub

Private Sub Text5_Change()
  VBrush(SelectedBrush).CanBuild = Int(Text5.Text)
End Sub

Private Sub Text6_Change()
  VBrush(SelectedBrush).Def = Int(Text6.Text)
End Sub

Private Sub Text7_Change()
  VBrush(SelectedBrush).Atack = Int(Text7.Text)
End Sub

Private Sub Text8_Change()
  VBrush(SelectedBrush).Speed = Int(Text8.Text)
End Sub

Private Sub Text9_Change()
  VBrush(SelectedBrush).Vrange = Int(Text9.Text)
End Sub

Private Sub Text10_Change()
  VBrush(SelectedBrush).Wrange = Int(Text10.Text)
End Sub

Private Sub Text11_Change()
  VBrush(SelectedBrush).Hide = Int(Text11.Text)
End Sub


