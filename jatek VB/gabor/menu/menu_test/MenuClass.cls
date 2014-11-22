VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "MenuClass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const Normal_Image_Pos = 0
Private Const MouseOver_Image_Pos = 1
Private Const MouseClicked_Image_Pos = 2
Private Const MouseSelectedBitmask_Image_Pos = 3



'#include ddraw.bas
'this class uses the ddaw module!
Private Type TButton
 Button_Width As Integer
 Button_Height As Integer
 Surface As DirectDrawSurface7
 x As Integer
 y As Integer
End Type

Private Button() As TButton

'Private Button_Width() As Integer
'Private Button_Height() As Integer
Private Button_Count As Integer
'Private Surface() As DirectDrawSurface7

' every image file has the folowing format
'4 images
'1. normal button image
'2. mouseover button image
'3. mouseclicked button image
'4. selected mask immage(only black or white)
'
' |-------|
' |image1 | 1. normal button image
' |image2 | 2. mouseover button image
' |image3 | 3. mouseclicked button image
' |image4 | 4. selected mask immage(only black or white)
' |-------|
'



'call this before initializing the buttons
'if you whant to modify (ex add a buton)
'you have to destroy and reinit the class and the buttons

Public Sub Init_Class(MenuNr As Integer)
Dim i As Integer
'ReDim Surface(MenuNr)
'ReDim Button_Width(MenuNr)
'ReDim Button_Height(MenuNr)
ReDim Button(MenuNr)
End Sub

Public Sub Destroy_Class()
Dim i As Integer
For i = 0 To Button_Count
 Set Button(i).Surface = Nothing
Next i
End Sub

Public Sub Init_Button(ButtonNr As Integer, Filename As String, x As Integer, y As Integer)
Dim sd As DDSURFACEDESC2
Dim colorkey As DDCOLORKEY

'lila szin
colorkey.low = RGB(255, 0, 255)
colorkey.high = RGB(255, 0, 255)
'put here a constant if you what to change it!!

Set Button(ButtonNr).Surface = CreateDDSFromFile(Filename, dd)
Button(ButtonNr).Surface.SetColorKey DDCKEY_SRCBLT, colorkey
Button(ButtonNr).Surface.GetSurfaceDesc sd
Button(ButtonNr).Button_Width = sd.lWidth
Button(ButtonNr).x = x
Button(ButtonNr).y = y

If sd.lHeight Mod 4 <> 0 Then
 MsgBox Filename + " has incorrect format"
 End
End If
Button(ButtonNr).Button_Height = sd.lHeight \ 4
End Sub

Public Function MouseInButtonRect(ButtonNr As Integer) As Boolean
With Button(ButtonNr)
MouseInButtonRect = ((MouseX >= .x) And (MouseX <= .x + .Button_Width)) And _
((MouseY >= .y) And (MouseY <= .y + .Button_Height))
End With
End Function


'xor mouse x and y with last image(4) and see

'call this function only and only if
'mouse is over the button rectange(over button)

Private Function MouseOverButton(ButtonNr As Integer) As Boolean
Dim r As RECT
Dim sd As DDSURFACEDESC2
Dim color As Long
'Dim rc As Integer
'Dim bc As Integer
'Dim gc As Integer
If Not MouseInButtonRect(ButtonNr) Then
 MouseOverButton = False
 Exit Function
End If

r.Left = 0
r.Right = Button(ButtonNr).Button_Width
r.Top = MouseSelectedBitmask_Image_Pos * Button(ButtonNr).Button_Height
r.Bottom = (MouseSelectedBitmask_Image_Pos + 1) * Button(ButtonNr).Button_Height  '? -1 kell e?

Button(ButtonNr).Surface.Lock r, sd, DDLOCK_READONLY, 0
color = Button(ButtonNr).Surface.GetLockedPixel _
(MouseX - Button(ButtonNr).x, r.Top + (MouseY - Button(ButtonNr).y) - 1)
Button(ButtonNr).Surface.Unlock r

If color = 0 Then
 MouseOverButton = True
 'backbuffer.DrawText 300, 70, "True", False
Else
 MouseOverButton = False
 'backbuffer.DrawText 300, 70, "False", False
End If
'backbuffer.SetForeColor QBColor(4)

'color = color
'rc = color Mod 256
'     color = color \ 256
'gc = color Mod 256
'     color = color \ 256
'bc = color Mod 256

'backbuffer.DrawText 300, 50, Str(color), False
'backbuffer.DrawText 300, 50, Str(rc) + "," + Str(gc) + "," + Str(bc), False
'backbuffer.DrawText 300, 110, "y=" + Str(r.Top + (MouseY - Button(ButtonNr).y) - 1), False
End Function

'status what image  =one of ...image_pos const
Public Sub PrintButton(ButtonNr As Integer, status As Integer)
Dim r As RECT
r.Top = status * Button(ButtonNr).Button_Height
r.Left = 0
r.Bottom = r.Top + Button(ButtonNr).Button_Height
r.Right = Button(ButtonNr).Button_Width

'Call backbuffer.BltFast(BrushWidth + Button(ButtonNr).x, BrushHeight + Button(ButtonNr).y, Button(ButtonNr).Surface, r, DDBLTFAST_SRCCOLORKEY Or DDBLTFAST_WAIT)
backbuffer.BltFast BrushWidth + Button(ButtonNr).x, BrushHeight + Button(ButtonNr).y, Button(ButtonNr).Surface, r, DDBLTFAST_WAIT Or DDBLTFAST_SRCCOLORKEY
End Sub


Public Sub RefreshButton(ButtonNr As Integer)
Dim b As Integer
b = 0
'If MouseInButtonRect(ButtonNr) Then
' If MouseOverButton(ButtonNr) Then
'  PrintButton 1, 1
'  b = 1
' End If
'Else
' PrintButton 1, 0
' b = 1
'End If

'csak igy mukodik
'nem szabad megvaltoztatni

'If Not MouseInButtonRect(ButtonNr) Then
' PrintButton ButtonNr, 0
' b = 1
'ElseIf MouseOverButton(ButtonNr) Then
' PrintButton ButtonNr, 1
' b = 1
'Else
' PrintButton ButtonNr, 0
' b = 1
'End If


If Not MouseOverButton(ButtonNr) Then
 PrintButton ButtonNr, Normal_Image_Pos 'normal...
ElseIf MouseButton Mod 2 <> 0 Then  'if bit 0 is set
 PrintButton ButtonNr, MouseClicked_Image_Pos
 'backbuffer.DrawText 300, 130, "After end=" + Str(MouseButton And vbLeftButton), False
Else
 PrintButton ButtonNr, MouseOver_Image_Pos
End If
End Sub
