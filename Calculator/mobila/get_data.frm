VERSION 5.00
Begin VB.Form get_number 
   Caption         =   "Blmc(mobila):date de intrare"
   ClientHeight    =   1725
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5775
   LinkTopic       =   "Form1"
   ScaleHeight     =   1725
   ScaleWidth      =   5775
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Bend 
      Caption         =   "terminat"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   1200
      Width           =   1935
   End
   Begin VB.CommandButton Badd 
      Caption         =   "Adauga"
      Height          =   375
      Left            =   480
      TabIndex        =   2
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox Tget_number 
      Height          =   285
      Left            =   1080
      TabIndex        =   1
      Top             =   600
      Width           =   3615
   End
   Begin VB.Label Lget_number 
      Caption         =   "Introduceti  numarul urmator in baza 10"
      Height          =   255
      Left            =   1440
      TabIndex        =   0
      Top             =   120
      Width           =   2895
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
     c2float nrelem
     nrelem = nrelem + 1
     get_number.Lget_number = "Introduceti numarul " + Str(nrelem) + " in baza 10"
     Me.Tget_number = ""
     Me.Tget_number.SetFocus
     velem(nrelem).e = 0
    Else: MsgBox "Nu ati introdus numarul"
   End If
End Sub

Private Sub Bend_Click()
  Me.Hide
End Sub

Private Sub Tget_number_KeyPress(KeyAscii As Integer)
  If (KeyAscii = vbKeyReturn) Then Badd_Click
  If (KeyAscii = vbKeyEscape) Then Bend_Click
End Sub
