VERSION 5.00
Begin VB.MDIForm F_Main 
   BackColor       =   &H00400040&
   Caption         =   "Knights : Map editor"
   ClientHeight    =   6255
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7665
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Menu M_File 
      Caption         =   "File"
      Index           =   2
      Begin VB.Menu M_New 
         Caption         =   "New"
      End
      Begin VB.Menu M_Open 
         Caption         =   "Open"
      End
      Begin VB.Menu M_Save 
         Caption         =   "Save"
      End
      Begin VB.Menu M_Exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu M_Tools 
      Caption         =   "Tools"
      Index           =   3
      Begin VB.Menu M_Properties 
         Caption         =   "Properties"
      End
      Begin VB.Menu M_Animate 
         Caption         =   "Animate"
         Checked         =   -1  'True
         Shortcut        =   ^A
      End
      Begin VB.Menu M_Grid 
         Caption         =   "Grid"
         Checked         =   -1  'True
      End
   End
End
Attribute VB_Name = "F_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub M_Animate_Click()
  M_Animate.Checked = Not (M_Animate.Checked)
  F_Map.Timer1.Enabled = M_Animate.Checked
  F_Map.Cls
  RefreshMap
 End Sub

Private Sub M_Exit_Click()
  F_Main_Unload
End Sub

Private Sub M_Grid_Click()
  M_Grid.Checked = Not (M_Grid.Checked)
  F_Map.Cls
  RefreshMap
End Sub

Private Sub M_New_Click()
'  Dim Path As String
  Dim Name As String
  Dim i As Integer, j As Integer
'  'beolvassa a path-et es a file nevet
'  path = "c:\mystuff\jatek\tudi\mapeditor" + MapDir
'  Name = "test.map"
  'keszit egy default headert neki
  MHeader.Coment = "" 'a terkeprol meg nincs egyelore extra informacio
  MHeader.MFog = 0 'nincs specialis fog of war terkep
  MHeader.MHeight = 0 'nincs specialis magasagi terkep
  MHeader.MMap = 1 'kell hatter terkep
  MHeader.NrCity = 0 'meg ures a terkep
  MHeader.NrMine = 0 'meg ures a terkep
  MHeader.NrUnit = 0 'meg ures a terkep
  MHeader.NrPlayers = 0 'meg ures a terkep
  MHeader.WarFog = 1 'a terkepet takarja fog of war
  'inicializaljuk a terkepeket
  For j = 1 To MaxMapY
    For i = 1 To MaxMapY
      MMap(j, i) = MapInitBrush
      MFog(j, i) = MapInitBrush
'      If (i + j) Mod 2 = 0 Then MMap(j, i) = 1
'      If (i + j) Mod 3 = 0 Then
'        Else: MMap(j, i) = 3
'      End If
    Next
  Next
  'loadol neki egy defaul brush settinget
  Fuggvenyek.LoadDefaultBrushSettings
  'megjelenik a getdata ablak
  F_GetData.Show
End Sub

Private Sub M_Open_Click()
  F_OpenFile.Show
End Sub

Private Sub M_Properties_Click()
  F_GetData.Show
  F_GetData.T_name.Text = Valtozok_tipusok.Name
  F_GetData.T_coment.Text = MHeader.Coment
  F_GetData.T_X.Text = MHeader.x
  F_GetData.T_Y.Text = MHeader.y
End Sub

Private Sub M_Save_Click()
  SaveMap
End Sub

Private Sub MDIForm_Load()
'inicializalasok
 InitAll
End Sub

Private Sub F_Main_Unload()
 Unload Me
End Sub
