VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   840
      Top             =   720
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim kep As New AnimatedPicture
Dim i As Integer

Sub Test()
Dim bInit As Boolean
Dim file As String
    i = 1
    Set dd = dx.DirectDrawCreate("")
    Me.Show
    
    'indicate that we dont need to change display depth
    Call dd.SetCooperativeLevel(Me.hWnd, DDSCL_FULLSCREEN Or DDSCL_ALLOWMODEX Or DDSCL_EXCLUSIVE)
    'Call dd.SetCooperativeLevel(Me.hWnd, DDSCL_NORMAL Or DDSCL_NOWINDOWCHANGES Or DDSCL_SETDEVICEWINDOW Or DDSCL_SETFOCUSWINDOW)
    Call dd.SetDisplayMode(800, 600, 16, 0, DDSDM_DEFAULT)
    
        
    'get the screen surface and create a back buffer too
    ddsd1.lFlags = DDSD_CAPS Or DDSD_BACKBUFFERCOUNT
    ddsd1.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE Or DDSCAPS_FLIP Or DDSCAPS_COMPLEX
    ddsd1.lBackBufferCount = 1
    Set primary = dd.CreateSurface(ddsd1)
    
    'Get the backbuffer
    Dim caps As DDSCAPS2
    caps.lCaps = DDSCAPS_BACKBUFFER
    Set backbuffer = primary.GetAttachedSurface(caps)
    backbuffer.GetSurfaceDesc ddsd4
   'select only one
   
   'kep.Init "d:\cumcum\donut.jpg", 10 * 6, 10, 64, 64
   'kep.Init "d:\cumcum\game\donut.bmp", 10 * 6, 10, 64, 64
'   kep.Init "d:\cumcum\asteroid1.jpg", 30, 4, 75, 75
   kep.Init "d:\cumcum\asteroid1_1.jpg", 30, 4, 75, 75
   'kep.Init "d:\cumcum\enemy1.jpg", 4 * 15 + 1, 4, 40, 50
   'kep.Init "d:\cumcum\blocker.gif", 4 * 30, 4, 31, 31
   'kep.Init "d:\cumcum\explosion.gif", 4 * 5, 4, 120, 120
Dim j As Integer

  While 1
  backbuffer.SetFillColor (0)
  backbuffer.DrawBox 0, 0, 800, 600
  For j = 0 To kep.FrameNr * 2 'max 96
  kep.PrintFrame i, (j \ 10) * kep.PWidth, (j Mod 10) * kep.PHeight
  Next j
  backbuffer.SetForeColor QBColor(7) 'white
  backbuffer.DrawText 10, 10, Format(i), False
  backbuffer.SetForeColor QBColor(0) 'black
  primary.Flip Nothing, DDFLIP_WAIT
  i = i + 1
  If i > kep.FrameNr Then i = 1
  DoEvents
 Wend
 End Sub

Private Sub Form_Load()
Test
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Set primary = Nothing
Set backbuffer = Nothing
Set dd = Nothing
Set dx = Nothing
Set kep = Nothing
Unload Me
End
End Sub

