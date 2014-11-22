VERSION 5.00
Begin VB.Form output 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Blmc(mobila): output pentru date"
   ClientHeight    =   7500
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7500
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox Loutput 
      Height          =   7470
      ItemData        =   "output.frx":0000
      Left            =   0
      List            =   "output.frx":0002
      TabIndex        =   0
      Top             =   0
      Width           =   5895
   End
End
Attribute VB_Name = "output"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
