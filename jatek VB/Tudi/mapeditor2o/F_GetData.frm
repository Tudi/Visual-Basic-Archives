VERSION 5.00
Begin VB.Form F_GetData 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Input data"
   ClientHeight    =   5250
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5250
   ScaleWidth      =   4680
   Begin VB.CommandButton B_ok 
      Caption         =   "Ok"
      Height          =   375
      Left            =   3000
      TabIndex        =   9
      Top             =   4680
      Width           =   1095
   End
   Begin VB.CommandButton B_cancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   360
      TabIndex        =   8
      Top             =   4680
      Width           =   1095
   End
   Begin VB.TextBox T_Y 
      Height          =   285
      Left            =   1560
      TabIndex        =   7
      Top             =   3720
      Width           =   1095
   End
   Begin VB.TextBox T_X 
      Height          =   285
      Left            =   1560
      TabIndex        =   5
      Top             =   2880
      Width           =   1095
   End
   Begin VB.TextBox T_coment 
      Height          =   855
      Left            =   480
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   1560
      Width           =   3375
   End
   Begin VB.TextBox T_name 
      Height          =   285
      Left            =   480
      TabIndex        =   1
      Top             =   600
      Width           =   3375
   End
   Begin VB.Label Label4 
      Caption         =   "Map size : Y (10 .. 250)"
      Height          =   255
      Left            =   1320
      TabIndex        =   6
      Top             =   3360
      Width           =   1695
   End
   Begin VB.Label Label3 
      Caption         =   "Map size : X (10 .. 250)"
      Height          =   255
      Left            =   1320
      TabIndex        =   4
      Top             =   2520
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "Map information (coment)"
      Height          =   255
      Left            =   1200
      TabIndex        =   2
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Map's name"
      Height          =   255
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "F_GetData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub B_Cancel_Click()
 Unload Me
End Sub

Private Sub B_Ok_Click()
 Dim B As Byte
 Dim i As Integer, j As Integer
 'nezzuk meg a beirt adat helyese vagy elegendo-e
 If T_name.Text = "" Then B = B + 1
 If Int(T_X.Text) < MinMapX Then B = B + 1
 On Local Error Resume Next
 If Int(T_X.Text) < MinMapY Then B = B + 1
 On Local Error Resume Next
 If Int(T_X.Text) > MaxMapX Then B = B + 1
 If Int(T_Y.Text) > MaxMapY Then B = B + 1
 If (B <> 0) Then
   MsgBox "There are wrong or no data"
  'taroljuk az adatokat es csukjuk be az ablakot
  Else: Valtozok_tipusok.Name = T_name.Text
        MHeader.Coment = T_coment.Text
        MHeader.x = Int(T_X.Text)
        MHeader.y = Int(T_Y.Text)
        'ja es a minimaprol se feledkezzunk el
        Me.Hide
        ReloadMiniMap
 End If
End Sub

