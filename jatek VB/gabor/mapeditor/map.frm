VERSION 5.00
Begin VB.Form map 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   105
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   Moveable        =   0   'False
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   ShowInTaskbar   =   0   'False
End
Attribute VB_Name = "map"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public cx1 As Long
Public cy1 As Long
Public MapSize As Integer
Dim kep As New AnimatedPicture
'how big is the map (Mapsize x Mapsize)
'ex. 255x255

'for directx
'Dim dx             As New DirectX7
'Dim dd             As DirectDraw7
'Dim Screen         As DirectDrawSurface7
'Dim backbuffer     As DirectDrawSurface7




Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
 
 Case K_Right
  If MapSize * BrushSize - cx1 > BrushCount * BrushSize Then
    cx1 = cx1 + 1
    RefreshScreen
  End If
 
 Case K_Down
  If MapSize * BrushSize - cy1 > BrushCount * BrushSize Then
    cy1 = cy1 + 1
    RefreshScreen
  End If
  
 Case K_Left
  If cx1 > 0 Then
    cx1 = cx1 - 1
    RefreshScreen
  End If
 
 Case K_Up
  If cy1 > 0 Then
    cy1 = cy1 - 1
    RefreshScreen
  End If
 
End Select

End Sub

Private Sub Form_Load()
Me.Show
Me.Top = 600
Me.Left = 100
Me.Width = 6000 - 130
Me.Height = 6000 - 130
cx1 = 0
cy1 = 0
MapSize = 15
Init_Ddraw
kep.Init "d:\cumcum\blocker.gif", 4 * 30, 4, 31, 31
Me.Cls
RefreshScreen
End Sub

Sub DrawGrid()
Dim i As Integer
Dim j As Integer
ForeColor = QBColor(0)
For i = 0 To BrushCount * BrushSize
 'vizszintes vonalak
 If (cy1 + i) Mod BrushSize = 0 Then
  'Line (0, i)-(BrushSize * BrushCount, i)
   backbuffer.DrawLine 0, i, BrushSize * BrushCount, i
 End If
 'fuggoleges vonalak
 If (cx1 + i) Mod BrushSize = 0 Then
  'Line (i, 0)-(i, BrushSize * BrushCount)
  backbuffer.DrawLine i, 0, i, BrushSize * BrushCount
 End If
Next


End Sub

Sub RefreshScreen()
Dim rs As RECT
Dim rd As RECT
Dim i As Integer
dx.GetWindowRect Me.hWnd, rd
rs.Left = 0
rs.Top = 0
rs.Bottom = rd.Bottom - rd.Top
rs.Right = rd.Right - rd.Left
backbuffer.SetFillColor (QBColor(8))
backbuffer.SetForeColor (QBColor(0))
'
backbuffer.DrawBox 0, 0, 13 * 30 + 1, 13 * 30 + 1
DrawGrid
For i = 0 To 12
kep.PrintFrame i + 1, i * 30, 0

Next i
primary.Blt rd, backbuffer, rs, DDBLT_WAIT
End Sub


Sub Init_Ddraw()
        
    Dim file As String
    
    'The empty string parameter means use the active display
    Set dd = dx.DirectDrawCreate("")
    Me.Show
    
    'Indicate the application will be a normal windowed application
    'with the same display depth as the current display
    Call dd.SetCooperativeLevel(Me.hWnd, DDSCL_NORMAL)
   
    
    '----- getting a surface that represents the screen
        
    'Indicate that the ddsCaps member is valid
    ddsdprimary.lFlags = DDSD_CAPS
    
    'Ask for the primary surface (one that is visible on the screen)
    ddsdprimary.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE
    
    'Get the primary surface object
    Set primary = dd.CreateSurface(ddsdprimary)
    
    'Create a clipper object
    'Clippers are used to set the writable region of the screen
    Set DDClip = dd.CreateClipper(0)
    
    'Assoiciate the picture hwnd with the clipper
    DDClip.SetHWnd Me.hWnd
    
    'Have the blts to the screen clipped to the Picture box
   primary.SetClipper DDClip
    
    
    
    '----- creating an invisible  surface to draw to
    '      use it as a compositing surface in system memory
    
    'Indicate that we want to specify the ddscaps height and width
    'The format of the surface (bits per pixel) will be the same
    'as the primary
    ddsdBackBuffer.lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH
    
    'Indicate that we want a surface that is not visible and that
    'we want it in system memory wich is plentiful as opposed to
    'video memory
    ddsdBackBuffer.ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY
    
    'Specify the height and width of the surface to be the same
    'as the picture box (note unit are in pixels)
    ddsdBackBuffer.lWidth = Me.Width
    ddsdBackBuffer.lHeight = Me.Height
    
    'Create the requested surface
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
 
End Sub
