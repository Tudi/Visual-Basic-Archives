VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.1#0"; "COMCTL32.OCX"
Begin VB.Form F_SelectBrush 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "SelectBrush"
   ClientHeight    =   2955
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4050
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   197
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   270
   ShowInTaskbar   =   0   'False
   Begin ComctlLib.TreeView TV1 
      Height          =   1830
      Left            =   180
      TabIndex        =   0
      Top             =   510
      Width           =   1425
      _ExtentX        =   2514
      _ExtentY        =   3228
      _Version        =   327680
      Style           =   7
      Appearance      =   1
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   2010
      Top             =   675
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327680
   End
End
Attribute VB_Name = "F_SelectBrush"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Dim nodX As Node
'TV1.ImageList = ImageList1
Set nodX = TV1.Nodes.Add(, , "Terrain", "Terrain") '

'Set nodX = TV1.Nodes.Add("Terrain", tvwChild, "TL", "TLCorner", 1)
'Set nodX = TV1.Nodes.Add("Terrain", tvwChild, "L", "Left Side", 2)
'Set nodX = TV1.Nodes.Add("Terrain", tvwChild, "T", "Top Side", 3)
End Sub

