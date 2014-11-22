VERSION 5.00
Begin VB.Form brush_frm 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2010
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2460
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   134
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   164
   ShowInTaskbar   =   0   'False
End
Attribute VB_Name = "brush_frm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Me.Show
Me.Left = main.Width - 3000
Me.Top = 1700
Me.Width = 2700
Me.Height = 3000

End Sub
