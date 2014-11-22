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

'how big is the map (Mapsize x Mapsize)
'ex. 255x255
Dim kep As New AnimatedPicture



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
 
 Case K_Right
  If BrushMaxX * brushX - cx1 - Inc_Size >= VisibleBrushX * brushX Then
    cx1 = cx1 + Inc_Size
    RefreshScreen
  End If
 
 Case K_Down
  If BrushMaxY * brushY - cy1 - Inc_Size >= VisibleBrushY * brushY Then
    cy1 = cy1 + Inc_Size
    RefreshScreen
  End If
  
 Case K_Left
  If cx1 >= Inc_Size Then
    cx1 = cx1 - Inc_Size
    RefreshScreen
  End If
 
 Case K_Up
  If cy1 >= Inc_Size Then
    cy1 = cy1 - Inc_Size
    RefreshScreen
  End If
  
 Case K_R
  RefreshScreen
End Select

End Sub

Private Sub Form_Load()

Dim frmn(3) As Integer
Me.Show
Me.Top = 600
Me.Left = 100
Me.Width = 6000 - 130
Me.Height = 6000 - 130
cx1 = 0
cy1 = 0
'test only

Init_Ddraw
frmn(1) = 10
frmn(2) = 10
kep.Init "d:\cumcum\testnewani.jpg", 2, frmn
Me.Cls
RefreshScreen
End Sub

Sub DrawGrid()
Dim i As Integer

For i = 0 To VisibleBrushY * brushY
 'vizszintes vonalak
 If (cy1 + i) Mod brushX = 0 Then
  'Line (0, i)-(BrushSize * BrushCount, i)
   backbuffer.DrawLine brushX, brushY + i, brushX + brushX * VisibleBrushX, brushY + i
 End If
Next

For i = 0 To VisibleBrushX * brushX
 'fuggoleges vonalak
 If (cx1 + i) Mod brushY = 0 Then
  'Line (i, 0)-(i, BrushSize * BrushCount)
  backbuffer.DrawLine brushX + i, brushY, brushX + i, brushY + brushY * VisibleBrushY
 End If
Next

End Sub

Sub RefreshScreen()
Dim i As Integer
Dim j As Integer
Dim rs As RECT
Dim rd As RECT
dx.GetWindowRect Me.hWnd, rd
rs.Left = brushX
rs.Top = brushY
rs.Bottom = rd.Bottom - rd.Top + brushY
rs.Right = rd.Right - rd.Left + brushX
backbuffer.SetFillColor (QBColor(8))
backbuffer.SetForeColor (QBColor(0))
'
backbuffer.DrawBox brushX, brushY, brushX + VisibleBrushX * brushX + 1, brushY + VisibleBrushY * brushY + 1
DrawGrid
'testarea
kep.NextFrame 1, GetRealX(420), GetRealY(150)
kep.NextFrame (2), GetRealX(i * brushX), GetRealY(j * brushY)
For i = 0 To BrushMaxX - 1
 For j = 0 To BrushMaxY - 1
  kep.PrintFrame 1, kep.GetLastFrameNr(1), GetRealX(i * brushX), GetRealY(j * brushY)
  If i = j Then kep.PrintFrame 2, kep.GetLastFrameNr(2), GetRealX(i * brushX), GetRealY(j * brushY)
 Next j
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
    ddsdPrimary.lFlags = DDSD_CAPS
    
    'Ask for the primary surface (one that is visible on the screen)
    ddsdPrimary.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE
    
    'Get the primary surface object
    Set primary = dd.CreateSurface(ddsdPrimary)
    
    'Create a clipper object
    'Clippers are used to set the writable region of the screen
  '  Set DDClip = dd.CreateClipper(0)
    
    'Assoiciate the picture hwnd with the clipper
  '  DDClip.SetHWnd Me.hWnd
    
    'Have the blts to the screen clipped to the Picture box
 '  primary.SetClipper DDClip
    
    
    
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
    'as the picture box (note unit aren pixels)
    'MsgBox Me.Width
    ddsdBackBuffer.lWidth = VisibleBrushX * brushX + 2 * brushX
    ddsdBackBuffer.lHeight = VisibleBrushY * brushY + 2 * brushY
    
    'Create the requested surface
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
 
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = vbRightButton Then Me.SetFocus
End Sub
