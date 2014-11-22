VERSION 5.00
Begin VB.Form F_OpenFile 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4065
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5880
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   271
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   392
   Begin VB.CommandButton B_Ok 
      Caption         =   "Ok"
      Height          =   375
      Left            =   3480
      TabIndex        =   4
      Top             =   3360
      Width           =   1095
   End
   Begin VB.CommandButton B_Cancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   840
      TabIndex        =   3
      Top             =   3360
      Width           =   1335
   End
   Begin VB.DirListBox Dir1 
      Height          =   2340
      Left            =   120
      TabIndex        =   2
      Top             =   615
      Width           =   2775
   End
   Begin VB.FileListBox File1 
      Height          =   2430
      Left            =   3000
      Pattern         =   "*.map"
      TabIndex        =   1
      Top             =   600
      Width           =   2775
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
End
Attribute VB_Name = "F_OpenFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub B_Cancel_Click()
  Me.Hide
  F_Map.Cls
  RefreshMap
End Sub

Private Sub B_Ok_Click()
  LoadMap File1.FileName
  Me.Hide
  F_Map.Cls
  RefreshMap
End Sub

Private Sub Dir1_Change()
  File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
 Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_DblClick()
  LoadMap File1.FileName
  Me.Hide
End Sub

Private Sub File1_KeyPress(KeyAscii As Integer)
  If KeyAscii = vbKeyReturn Then
    LoadMap File1.FileName
    Me.Hide
  End If
End Sub

Private Sub Form_Load()
 Dir1.Path = Path + PathMap
End Sub
