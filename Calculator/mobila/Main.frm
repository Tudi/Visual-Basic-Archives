VERSION 5.00
Begin VB.Form Main 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Blmc: Operatii cu numere reprezentate in virgula mobila"
   ClientHeight    =   4170
   ClientLeft      =   150
   ClientTop       =   390
   ClientWidth     =   7515
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Main.frx":0000
   ScaleHeight     =   4170
   ScaleWidth      =   7515
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "calculator"
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   3960
      Width           =   975
   End
   Begin VB.CommandButton bview 
      Caption         =   "datele"
      Height          =   495
      Left            =   720
      TabIndex        =   5
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CommandButton Bexit 
      Caption         =   "Iesire"
      Height          =   495
      Left            =   3960
      TabIndex        =   4
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton Bszamit 
      Caption         =   "calculeaza"
      Height          =   495
      Left            =   5280
      TabIndex        =   2
      Top             =   2400
      Width           =   1335
   End
   Begin VB.CommandButton Bmuvelet 
      Caption         =   "Alege operatiunea"
      Height          =   495
      Left            =   4320
      TabIndex        =   1
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton Badat 
      Caption         =   "Introduce date"
      DisabledPicture =   "Main.frx":1B42C
      DownPicture     =   "Main.frx":3890C
      Height          =   495
      Left            =   1560
      Picture         =   "Main.frx":55DEC
      TabIndex        =   0
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton Bujra 
      Caption         =   "Nou"
      Height          =   495
      Left            =   2040
      TabIndex        =   3
      Top             =   3000
      Width           =   1335
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Badat_Click()
  get_number.Lget_number = "Introduceti numarul" + Str(nrelem) + " in baza 10"
  get_number.Visible = True
  get_number.Tget_number.SetFocus
End Sub

Private Sub Bexit_Click()
 Unload Main
End Sub

Private Sub Bmuvelet_Click()
 get_muvelet.Visible = True
End Sub

Public Sub Bszamit_Click()
  szoutput.Visible = True
  If (muvelet = 1) Then osszeadja
  If (muvelet = 3) Then szorozza
  If (muvelet = 2) Then ossza
End Sub

Private Sub Bujra_Click()
 Dim i As Integer, j As Integer
 nrelem = 1
 muvelet = 1
 kurensbazis = 10
 get_muvelet.Option1.Value = True
 For i = 1 To 50
  velem(i).e = ""
  velem(i).exp = 0
  velem(i).f = ""
  velem(i).m = ""
  velem(i).s = 0
  For j = 0 To 32
   velem(i).de(j) = 0
   velem(i).ce(j) = 0
   velem(i).ad(j) = 0
   velem(i).fb(j) = 0
   velem(i).mb(j) = 0
   velem(i).inm(j) = 0
  Next
 Next
End Sub

Private Sub bview_Click()
 output.Loutput.Clear
 output.Visible = True
 Dim sd, sc, si As String
 Dim i, j As Integer
 output.Loutput.AddItem "numerele reprezentate in standardul IEEE P754"
 For i = 1 To nrelem - 1
   sd = ""
   For j = 1 To 32
     sd = sd + Str(velem(i).de(j))
     If (j = 1) Then sd = sd + "|"
     If (j = 9) Then sd = sd + "|"
   Next
   output.Loutput.AddItem "numarul " + Str(i) + " introdus : " + velem(i).e + " in baza : 10"
   output.Loutput.AddItem sd
   output.Loutput.AddItem ""
   output.Loutput.AddItem "*************************************************************************************************"
   Next
End Sub

Private Sub Command1_Click()
  Dim RetVal
  RetVal = Shell("C:\WINDOWS\CALC.EXE", 1)
End Sub

Private Sub Form_Load()
 output.Visible = False
 get_muvelet.Visible = False
 get_number.Visible = False
 szoutput.Visible = False
 szoutput.M_info_false.Checked = True
 szoutput.M_info_true.Checked = False
 Bujra_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)
 Unload get_number
 Unload get_muvelet
 Unload output
 Unload szoutput
End Sub

'Private Sub Mnumbers_Click()
' Dim i As Integer
' Morg = True
' output.Cls
' For i = 1 To nrelem
'  output.Loutput.AddItem velem(i).e
'  Next
' output.Visible = True
' output.Refresh
'End Sub
