VERSION 5.00
Begin VB.Form F_SelectBrush 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "SelectBrush"
   ClientHeight    =   1215
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   885
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   81
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   59
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Ok"
      Height          =   315
      Left            =   15
      TabIndex        =   1
      Top             =   480
      Width           =   885
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   45
      Width           =   630
   End
   Begin VB.Label L_KurensBrush 
      Height          =   285
      Left            =   105
      TabIndex        =   2
      Top             =   855
      Width           =   690
   End
End
Attribute VB_Name = "F_SelectBrush"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  If (Len(Text1.Text) > 0) Then SelectedBrush = Int("0" + Text1.Text)
  On Error Resume Next
  L_KurensBrush.Caption = Text1.Text
  RefreshProperties
  RefreshSelectColor
End Sub

Private Sub Form_Click()
  L_KurensBrush.Caption = Str(SelectedBrush)
End Sub

