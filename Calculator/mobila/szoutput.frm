VERSION 5.00
Begin VB.Form szoutput 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Blmc(mobila): output pentru operatii"
   ClientHeight    =   6690
   ClientLeft      =   150
   ClientTop       =   675
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6690
   ScaleWidth      =   8760
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox Loutput 
      Height          =   6690
      ItemData        =   "szoutput.frx":0000
      Left            =   0
      List            =   "szoutput.frx":0002
      TabIndex        =   0
      Top             =   0
      Width           =   8775
   End
   Begin VB.Menu Minfo 
      Caption         =   "Informatiile vizibile"
      Begin VB.Menu M_info_true 
         Caption         =   "true"
      End
      Begin VB.Menu M_info_false 
         Caption         =   "false"
      End
   End
End
Attribute VB_Name = "szoutput"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub M_info_false_Click()
 szoutput.M_info_false.Checked = True
 szoutput.M_info_true.Checked = False
 Main.Bszamit_Click
End Sub

Private Sub M_info_true_Click()
 szoutput.M_info_false.Checked = False
 szoutput.M_info_true.Checked = True
 Main.Bszamit_Click
End Sub
