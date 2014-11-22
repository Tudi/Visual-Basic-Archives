VERSION 5.00
Begin VB.Form F_Main 
   BorderStyle     =   0  'None
   Caption         =   "Menu Tets"
   ClientHeight    =   3165
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   ScaleHeight     =   211
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   279
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "F_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim menu As New MenuClass

Private Sub Form_Load()
Init_Ddraw
initMenu
Do While 1
RefreshScreen
DoEvents
Loop
End Sub


Sub Init_Ddraw()
    'Dim file As String
    Dim sd As DDSURFACEDESC2
    Set dd = dx.DirectDrawCreate("")
    Me.Show
    Call dd.SetCooperativeLevel(F_Main.hWnd, DDSCL_FULLSCREEN Or DDSCL_EXCLUSIVE)
    dd.GetDisplayMode sd
   ' If sd.ddpfPixelFormat.lRGBBitCount < 24 Then
   '  MsgBox "Set your bpp to 24 or hier"
   '  End 'exits program or something like that.
   ' End If
     
    'dd.SetDisplayMode sd.lWidth, sd.lHeight, 24, 0, DDSDM_DEFAULT
'    dd.SetDisplayMode sd.lWidth, sd.lHeight, 16, 0, DDSDM_DEFAULT
    On Local Error Resume Next
    dd.SetDisplayMode 800, 600, 24, 0, DDSDM_DEFAULT
    If Err.Number <> 0 Then
     Unload F_Main
     MsgBox "Can't set to resolution 640x480,24"
     End
    End If
    
    ddsdPrimary.lFlags = DDSD_CAPS
    ddsdPrimary.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE
    Set primary = dd.CreateSurface(ddsdPrimary)
    ddsdBackBuffer.lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH
    ddsdBackBuffer.ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY
    ddsdBackBuffer.lWidth = sd.lWidth + 3 * BrushWidth
    ddsdBackBuffer.lHeight = sd.lHeight + 3 * BrushHeight
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = vbRightButton Then
 ExitApp
End If
MouseButton = MouseButton Xor Button
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseX = x
MouseY = y
MouseButton = Button
End Sub

'only for testing!!!
Sub RefreshScreen()
Dim rs As RECT
'Dim rd As RECT
'primary.Blt rd, backbuffer, rs, DDBLT_WAIT
backbuffer.SetFillStyle 0
backbuffer.SetFillColor (QBColor(0))
backbuffer.DrawBox 0, 0, 640 + BrushWidth + 1, 480 + BrushHeight + 1
backbuffer.DrawText 300, 110, "Press right mouse button to exit", False
menu.RefreshButton 1
menu.RefreshButton 2

backbuffer.SetForeColor QBColor(15)
backbuffer.DrawText 300, 60, Str(MouseButton), False

backbuffer.DrawText 300, 130, Str(dx.TickCount), False
backbuffer.DrawText 300, 150, Str(Time), False

rs.Left = BrushWidth
rs.Top = BrushHeight
rs.Right = rs.Left + 640
rs.Bottom = rs.Top + 480

primary.BltFast 0, 0, backbuffer, rs, DDBLTFAST_WAIT
End Sub

Public Sub initMenu()
menu.Init_Class 2
menu.Init_Button 1, "d:\cumcum\button1.bmp", 50, 50
menu.Init_Button 2, "d:\cumcum\starbutton.bmp", 100, 100
End Sub



Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
'MouseButton = Button
'MsgBox Button
'MouseButton = Button
MouseButton = MouseButton Xor Button
End Sub



Public Sub ExitApp()
menu.Destroy_Class
Destroy_DDraw
End
End Sub
