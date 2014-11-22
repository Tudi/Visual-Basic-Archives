VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form F_BProp 
   BorderStyle     =   0  'None
   Caption         =   "Properties"
   ClientHeight    =   3885
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3135
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3885
   ScaleWidth      =   3135
   ShowInTaskbar   =   0   'False
   Begin TabDlg.SSTab SSTab1 
      Height          =   3705
      Left            =   75
      TabIndex        =   0
      Top             =   120
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   6535
      _Version        =   327680
      Tabs            =   2
      Tab             =   1
      TabsPerRow      =   2
      TabHeight       =   520
      TabCaption(0)   =   "BrushProp1"
      TabPicture(0)   =   "F_BProp.frx":0000
      Tab(0).ControlCount=   12
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Label5"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label4"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label3"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label2"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label1"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label11"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Text5"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Text4"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Text3"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Text2"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Text1"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "Text11"
      Tab(0).Control(11).Enabled=   0   'False
      TabCaption(1)   =   "BrushProp2"
      TabPicture(1)   =   "F_BProp.frx":001C
      Tab(1).ControlCount=   12
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label10"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Label9"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Label8"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Label7"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Label6"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "Label12"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "Text10"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Text9"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "Text8"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "Text7"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "Text6"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).Control(11)=   "Text12"
      Tab(1).Control(11).Enabled=   0   'False
      Begin VB.TextBox Text12 
         Height          =   315
         Left            =   1980
         TabIndex        =   25
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox Text11 
         Height          =   315
         Left            =   -73020
         TabIndex        =   22
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox Text6 
         Height          =   315
         Left            =   1980
         TabIndex        =   16
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox Text7 
         Height          =   315
         Left            =   1980
         TabIndex        =   15
         Top             =   624
         Width           =   975
      End
      Begin VB.TextBox Text8 
         Height          =   315
         Left            =   1980
         TabIndex        =   14
         Top             =   888
         Width           =   975
      End
      Begin VB.TextBox Text9 
         Height          =   315
         Left            =   1980
         TabIndex        =   13
         Top             =   1152
         Width           =   975
      End
      Begin VB.TextBox Text10 
         Height          =   315
         Left            =   1980
         TabIndex        =   12
         Top             =   1416
         Width           =   975
      End
      Begin VB.TextBox Text1 
         Height          =   315
         Left            =   -73020
         TabIndex        =   6
         Top             =   420
         Width           =   975
      End
      Begin VB.TextBox Text2 
         Height          =   315
         Left            =   -73020
         TabIndex        =   5
         Top             =   672
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Height          =   315
         Left            =   -73020
         TabIndex        =   4
         Top             =   924
         Width           =   975
      End
      Begin VB.TextBox Text4 
         Height          =   315
         Left            =   -73020
         TabIndex        =   3
         Top             =   1176
         Width           =   975
      End
      Begin VB.TextBox Text5 
         Height          =   315
         Left            =   -73020
         TabIndex        =   2
         Top             =   1428
         Width           =   975
      End
      Begin VB.Label Label12 
         Caption         =   "Minerals"
         Height          =   255
         Left            =   300
         TabIndex        =   24
         Top             =   1710
         Width           =   1545
      End
      Begin VB.Label Label11 
         Caption         =   "   Hides units ?"
         Height          =   270
         Left            =   -74925
         TabIndex        =   23
         Top             =   1740
         Width           =   1965
      End
      Begin VB.Label Label6 
         Caption         =   "   + Defense"
         Height          =   270
         Left            =   150
         TabIndex        =   21
         Top             =   405
         Width           =   1980
      End
      Begin VB.Label Label7 
         Caption         =   "   + Damage "
         Height          =   270
         Left            =   150
         TabIndex        =   20
         Top             =   675
         Width           =   1995
      End
      Begin VB.Label Label8 
         Caption         =   "   + Speed"
         Height          =   300
         Left            =   150
         TabIndex        =   19
         Top             =   945
         Width           =   1980
      End
      Begin VB.Label Label9 
         Caption         =   "   +Sight range"
         Height          =   240
         Left            =   150
         TabIndex        =   18
         Top             =   1245
         Width           =   2025
      End
      Begin VB.Label Label10 
         Caption         =   "   + Weapon Range"
         Height          =   270
         Left            =   150
         TabIndex        =   17
         Top             =   1485
         Width           =   1980
      End
      Begin VB.Label Label1 
         Caption         =   "   Crossable by foot ?"
         Height          =   195
         Left            =   -74910
         TabIndex        =   11
         Top             =   435
         Width           =   1980
      End
      Begin VB.Label Label2 
         Caption         =   "   Crossable by plane ?"
         Height          =   255
         Left            =   -74925
         TabIndex        =   10
         Top             =   690
         Width           =   1980
      End
      Begin VB.Label Label3 
         Caption         =   "   Crosabble by boat ?"
         Height          =   255
         Left            =   -74940
         TabIndex        =   9
         Top             =   960
         Width           =   1980
      End
      Begin VB.Label Label4 
         Caption         =   "   Elevation height"
         Height          =   270
         Left            =   -74940
         TabIndex        =   8
         Top             =   1230
         Width           =   1980
      End
      Begin VB.Label Label5 
         Caption         =   "   Can build on it ?"
         Height          =   285
         Left            =   -74940
         TabIndex        =   7
         Top             =   1515
         Width           =   1995
      End
      Begin VB.Label Label14 
         Caption         =   "Label14"
         Height          =   255
         Left            =   -4440
         TabIndex        =   1
         Top             =   -165
         Width           =   795
      End
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

Private Sub Text12_Change()
  VBrush(SelectedBrush).Mineral = Int(Text12.Text)
End Sub

