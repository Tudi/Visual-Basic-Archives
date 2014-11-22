VERSION 5.00
Begin VB.Form Main 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Proiectul de BLMC"
   ClientHeight    =   2985
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "choose.frx":0000
   ScaleHeight     =   2985
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      Height          =   615
      Left            =   3720
      Picture         =   "choose.frx":494C
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      Height          =   615
      Left            =   720
      Picture         =   "choose.frx":5595
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   1320
      Width           =   1575
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Dim RetVal
  Dim s As String
  s = CurDir
  RetVal = Shell(s + "\fixa\fix.exe", 1)
End Sub

Private Sub Command2_Click()
  Dim RetVal
  Dim s As String
  s = CurDir
  RetVal = Shell(s + "\mobila\mobila.exe", 1)
End Sub
