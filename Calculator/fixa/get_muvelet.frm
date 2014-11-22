VERSION 5.00
Begin VB.Form get_muvelet 
   Caption         =   "Blmc(fixa):date de intrare"
   ClientHeight    =   2955
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4020
   LinkTopic       =   "Form1"
   ScaleHeight     =   2955
   ScaleWidth      =   4020
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Inapoi"
      Height          =   495
      Left            =   1440
      TabIndex        =   5
      Top             =   2160
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Height          =   855
      Left            =   480
      TabIndex        =   1
      Top             =   840
      Width           =   3135
      Begin VB.OptionButton Option3 
         Caption         =   "Booth"
         Height          =   195
         Left            =   2040
         TabIndex        =   4
         Top             =   120
         Width           =   975
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Robertson"
         Height          =   195
         Left            =   960
         TabIndex        =   3
         Top             =   480
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Adunarre"
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   120
         Width           =   975
      End
   End
   Begin VB.Label Label1 
      Caption         =   "Alegeti ce operatie sa execute programul"
      Height          =   375
      Left            =   600
      TabIndex        =   0
      Top             =   240
      Width           =   3015
   End
End
Attribute VB_Name = "get_muvelet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
 get_muvelet.Visible = False
End Sub

Private Sub Option2_Click()
 muvelet = 2
End Sub

Private Sub Option3_Click()
 muvelet = 3
End Sub
