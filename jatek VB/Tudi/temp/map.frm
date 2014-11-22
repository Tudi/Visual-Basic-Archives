VERSION 5.00
Begin VB.Form F_Map 
   BorderStyle     =   0  'None
   Caption         =   "Map"
   ClientHeight    =   3270
   ClientLeft      =   0
   ClientTop       =   105
   ClientWidth     =   3435
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   218
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   229
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   40
      Left            =   1365
      Top             =   1215
   End
End
Attribute VB_Name = "F_Map"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
 
 Case K_Right
  If BrushMaxX * BrushWidth - cx1 - Inc_Size >= VisibleBrushWidth * BrushWidth Then
    cx1 = cx1 + Inc_Size
    RefreshScreen
  End If
 
 Case K_Down
  If BrushMaxY * BrushHeight - cy1 - Inc_Size >= VisibleBrushHeight * BrushHeight Then
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
cx1 = 0
cy1 = 0
End Sub

Sub DrawGrid()
Dim i As Integer

For i = 0 To VisibleBrushHeight * BrushHeight
 'vizszintes vonalak
 If (cy1 + i) Mod BrushWidth = 0 Then
  'Line (0, i)-(BrushSize * BrushCount, i)
   backbuffer.DrawLine BrushWidth, BrushHeight + i, BrushWidth + BrushWidth * VisibleBrushWidth, BrushHeight + i
 End If
Next

For i = 0 To VisibleBrushWidth * BrushWidth
 'fuggoleges vonalak
 If (cx1 + i) Mod BrushHeight = 0 Then
  'Line (i, 0)-(i, BrushSize * BrushCount)
  backbuffer.DrawLine BrushWidth + i, BrushHeight, BrushWidth + i, BrushHeight + BrushHeight * VisibleBrushHeight
 End If
Next

End Sub

Sub RefreshScreen()
Dim i As Integer
Dim j As Integer
Dim rs As RECT
Dim rd As RECT
dx.GetWindowRect Me.hWnd, rd
rs.Left = BrushWidth
rs.Top = BrushHeight
rs.Bottom = rd.Bottom - rd.Top + BrushHeight
rs.Right = rd.Right - rd.Left + BrushWidth
backbuffer.SetFillColor (QBColor(8))
backbuffer.SetForeColor (QBColor(0))
'
backbuffer.DrawBox BrushWidth, BrushHeight, BrushWidth + VisibleBrushWidth * BrushWidth + 1, BrushHeight + VisibleBrushHeight * BrushHeight + 1
DrawGrid
'testarea
kep.NextFrame 1, GetRealX(420), GetRealY(150)
kep.NextFrame (2), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
kep.NextFrame (3), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
kep.NextFrame (4), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
Dim k As Integer
For i = 0 To BrushMaxX - 1
 For j = 0 To BrushMaxY - 1
  k = (i + j) Mod MaxBrush
  If (k = 1) Then
   kep.PrintFrame 1, kep.GetLastFrameNr(1), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
   ElseIf (k = 2) Then
        kep.PrintFrame 2, kep.GetLastFrameNr(2), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
   ElseIf (k = 3) Then
        kep.PrintFrame 3, kep.GetLastFrameNr(3), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
   Else: kep.PrintFrame MaxBrush, kep.GetLastFrameNr(MaxBrush), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
  End If
'  kep.PrintFrame 3, kep.GetLastFrameNr(1), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
'  If i = j Then kep.PrintFrame 2, kep.GetLastFrameNr(2), GetRealX(i * BrushWidth), GetRealY(j * BrushHeight)
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
    ddsdBackBuffer.lWidth = VisibleBrushWidth * BrushWidth + 2 * BrushWidth
    ddsdBackBuffer.lHeight = VisibleBrushHeight * BrushHeight + 2 * BrushHeight
    
    'Create the requested surface
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
 
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = vbRightButton Then Me.SetFocus
End Sub

Private Sub Timer1_Timer()
  If (F_Main.M_Animate.Checked = True) Then RefreshScreen
End Sub
