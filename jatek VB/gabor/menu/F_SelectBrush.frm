VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.0#0"; "COMCT232.OCX"
Begin VB.Form F_SelectBrush 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "SelectBrush"
   ClientHeight    =   585
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3465
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   39
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   231
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Height          =   450
      Left            =   1080
      ScaleHeight     =   26
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   26
      TabIndex        =   1
      Top             =   0
      Width           =   450
   End
   Begin ComCtl2.UpDown UpDown1 
      Height          =   240
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   423
      _Version        =   327680
      Orientation     =   1
      Enabled         =   -1  'True
   End
End
Attribute VB_Name = "F_SelectBrush"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Sub Init_UpDown()
UpDown1.Value = 1
UpDown1.Min = 0
UpDown1.Max = kep.GetBrushNr
End Sub

Private Sub UpDown1_Change()
SelectedBrush = UpDown1.Value
RefreshSelectedBrush
End Sub
