VERSION 5.00
Begin VB.Form get_number 
   Caption         =   "Blmc(fixa)"
   ClientHeight    =   3255
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5775
   LinkTopic       =   "Form1"
   ScaleHeight     =   3255
   ScaleWidth      =   5775
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   1335
      Left            =   240
      TabIndex        =   5
      Top             =   480
      Width           =   5055
      Begin VB.OptionButton Option21 
         Caption         =   "=M"
         Height          =   255
         Left            =   4320
         TabIndex        =   26
         Top             =   960
         Width           =   615
      End
      Begin VB.OptionButton Option20 
         Caption         =   "=L"
         Height          =   255
         Left            =   3600
         TabIndex        =   25
         Top             =   960
         Width           =   495
      End
      Begin VB.OptionButton Option19 
         Caption         =   "=K"
         Height          =   255
         Left            =   2880
         TabIndex        =   24
         Top             =   960
         Width           =   495
      End
      Begin VB.OptionButton Option18 
         Caption         =   "=J"
         Height          =   195
         Left            =   2160
         TabIndex        =   23
         Top             =   960
         Width           =   495
      End
      Begin VB.OptionButton Option17 
         Caption         =   "=I"
         Height          =   375
         Left            =   1440
         TabIndex        =   22
         Top             =   840
         Width           =   495
      End
      Begin VB.OptionButton Option16 
         Caption         =   "=H"
         Height          =   375
         Left            =   720
         TabIndex        =   21
         Top             =   840
         Width           =   615
      End
      Begin VB.OptionButton Option15 
         Caption         =   "=G"
         Height          =   315
         Left            =   120
         TabIndex        =   20
         Top             =   840
         Width           =   615
      End
      Begin VB.OptionButton Option1 
         Caption         =   "=2"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option2 
         Caption         =   "=3"
         Height          =   195
         Left            =   720
         TabIndex        =   18
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option3 
         Caption         =   "=4"
         Height          =   195
         Left            =   1440
         TabIndex        =   17
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option4 
         Caption         =   "=5"
         Height          =   195
         Left            =   2160
         TabIndex        =   16
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option5 
         Caption         =   "=6"
         Height          =   195
         Left            =   2880
         TabIndex        =   15
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option6 
         Caption         =   "=7"
         Height          =   195
         Left            =   3600
         TabIndex        =   14
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option7 
         Caption         =   "=8"
         Height          =   195
         Left            =   4320
         TabIndex        =   13
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton Option8 
         Caption         =   "=9"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   495
      End
      Begin VB.OptionButton Option9 
         Caption         =   "=A"
         Height          =   195
         Left            =   720
         TabIndex        =   11
         Top             =   600
         Value           =   -1  'True
         Width           =   495
      End
      Begin VB.OptionButton Option10 
         Caption         =   "=B"
         Height          =   195
         Left            =   1440
         TabIndex        =   10
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton Option11 
         Caption         =   "=C"
         Height          =   195
         Left            =   2160
         TabIndex        =   9
         Top             =   600
         Width           =   495
      End
      Begin VB.OptionButton Option12 
         Caption         =   "=D"
         Height          =   195
         Left            =   2880
         TabIndex        =   8
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton Option13 
         Caption         =   "=E"
         Height          =   195
         Left            =   3600
         TabIndex        =   7
         Top             =   600
         Width           =   495
      End
      Begin VB.OptionButton Option14 
         Caption         =   "=F"
         Height          =   195
         Left            =   4320
         TabIndex        =   6
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.CommandButton Bend 
      Caption         =   "terminat"
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   2760
      Width           =   1935
   End
   Begin VB.CommandButton Badd 
      Caption         =   "Adauga"
      Height          =   375
      Left            =   480
      TabIndex        =   3
      Top             =   2760
      Width           =   2055
   End
   Begin VB.TextBox Tget_number 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Top             =   2160
      Width           =   3615
   End
   Begin VB.Label Lget_number 
      Caption         =   "Introduceti  numarul urmator"
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Top             =   1800
      Width           =   2055
   End
   Begin VB.Label Lget_baza 
      Caption         =   "Alegeti baza numarului"
      Height          =   255
      Left            =   1920
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "get_number"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Badd_Click()
 Dim i, j As Integer
 Dim ind, k As Byte
   If (Len(Me.Tget_number) > 0) Then
     velem(nrelem).e = Me.Tget_number
     velem(nrelem).kb = kurensbazis
'     velem(nrelem).vb = 0
     cib10 nrelem
     cib2 velem(nrelem).e, velem(nrelem).de
     If (velem(nrelem).de(1) = 0) Then
       masol velem(nrelem).de, velem(nrelem).ce
       masol velem(nrelem).de, velem(nrelem).ie
       Else: cicc velem(nrelem).de, velem(nrelem).ce
             cici velem(nrelem).de, velem(nrelem).ie
     End If
     nrelem = nrelem + 1
     Me.Tget_number = ""
     Me.Tget_number.SetFocus
     velem(nrelem).e = 0
    Else: MsgBox "Nu ati numarul"
   End If
   
End Sub

Private Sub Bend_Click()
  Me.Hide
End Sub

Private Sub Tget_number_KeyPress(KeyAscii As Integer)
  If (KeyAscii = vbKeyReturn) Then Badd_Click
  If (KeyAscii = vbKeyEscape) Then Bend_Click
End Sub


Private Sub Option1_Click()
 kurensbazis = 2
 Me.Tget_number.SetFocus
End Sub

Private Sub Option10_Click()
 kurensbazis = 11
 Me.Tget_number.SetFocus
End Sub

Private Sub Option11_Click()
 kurensbazis = 12
 Me.Tget_number.SetFocus
End Sub

Private Sub Option12_Click()
 kurensbazis = 13
 Me.Tget_number.SetFocus
End Sub

Private Sub Option13_Click()
 kurensbazis = 14
 Me.Tget_number.SetFocus
End Sub

Private Sub Option14_Click()
 kurensbazis = 15
 Me.Tget_number.SetFocus
End Sub

Private Sub Option15_Click()
 kurensbazis = 16
 Me.Tget_number.SetFocus
End Sub

Private Sub Option16_Click()
 kurensbazis = 17
 Me.Tget_number.SetFocus
End Sub

Private Sub Option17_Click()
 kurensbazis = 18
 Me.Tget_number.SetFocus
End Sub

Private Sub Option18_Click()
 kurensbazis = 19
 Me.Tget_number.SetFocus
End Sub

Private Sub Option19_Click()
 kurensbazis = 20
 Me.Tget_number.SetFocus
End Sub

Private Sub Option2_Click()
 kurensbazis = 3
 Me.Tget_number.SetFocus
End Sub

Private Sub Option20_Click()
 kurensbazis = 21
 Me.Tget_number.SetFocus
End Sub

Private Sub Option21_Click()
 kurensbazis = 22
 Me.Tget_number.SetFocus
End Sub

Private Sub Option3_Click()
 kurensbazis = 4
 Me.Tget_number.SetFocus
End Sub

Private Sub Option4_Click()
 kurensbazis = 5
 Me.Tget_number.SetFocus
End Sub

Private Sub Option5_Click()
 kurensbazis = 6
 Me.Tget_number.SetFocus
End Sub

Private Sub Option6_Click()
 kurensbazis = 7
 Me.Tget_number.SetFocus
End Sub

Private Sub Option7_Click()
 kurensbazis = 8
 Me.Tget_number.SetFocus
End Sub

Private Sub Option8_Click()
 kurensbazis = 9
 Me.Tget_number.SetFocus
End Sub

Private Sub Option9_Click()
 kurensbazis = 10
If (get_number.Visible = True) Then get_number.Tget_number.SetFocus
End Sub


