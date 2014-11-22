VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "AnimatedPicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "This is used for loading an animanted picture and playing it."
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private FrameNr() As Integer
'Public FrameNr() As Integer
Private NextFrameNr() As Integer
Private Surface As DirectDrawSurface7
Private BrushCount As Integer

Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
                                        'used to create a DC for reading in and creating a direct draw surface from other formats besides .bmp
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
                                        'used to select the dc into an object
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
                                        'used to blit the bitmap from a dc to a direct draw surface
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
                                        'used to destroy a dc

Public Sub Init(FileName As String, brushnr As Integer, FrameNrArray() As Integer)
 Dim i As Integer
 
 ReDim NextFrameNr(brushnr)
 ReDim FrameNr(brushnr)
 
 For i = 0 To brushnr
  NextFrameNr(i) = 1
  FrameNr(i) = FrameNrArray(i)
 Next i
 
 Set Surface = CreateDDSFromFile(FileName, dd)
 BrushCount = brushnr
 
End Sub


Private Function CreateDDSFromFile(ByVal strFile As String, ByVal dd As DirectDraw7, Optional VideoMem As Boolean) As DirectDrawSurface7
    
    'This function creates a direct draw surface from any valid file format that loadpicture uses, and returns
    'the newly created surface
    
    If Dir(strFile) = "" Then                                               'If the file doesn't exist
'        DisplayError Err.Number, "Unable to create " & strFile & " as a Direct Draw surface." & vbCrLf & "Check to ensure this file exists and is in the same directory as Space Shooter.exe, and is a valid bitmap."
                                                                            'Send the displayerror sub the error message and location the error occurred
    End If
    
    Dim ddsd As DDSURFACEDESC2                                              'Surface description
    Dim dds As DirectDrawSurface7                                           'Created surface
    Dim hdcPicture As Long                                                  'Device context for picture
    Dim hdcSurface As Long                                                  'Device context for surface
    Dim Picture As StdPicture                                               'stdole2 StdPicture object
    
    Set Picture = LoadPicture(strFile)                                      'Load the bitmap
    
    With ddsd                                                               'Fill the surface description
        .lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH                    'Tell Direct Draw that the caps element is valid, the height element is valid, and the width element is valid
        If VideoMem Then                                                    'If the videomem flag is set, then
            .ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_VIDEOMEMORY  'Create the surface in video memory
        Else
            .ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY 'Otherwise, creat the surface in system memory
        End If
        .lWidth = Screen.ActiveForm.ScaleX(Picture.width, vbHimetric, vbPixels)
                                                                            'The width of the surface is set by scaling from the stdpicture objects vbhimetric scale mode to pixels
        .lHeight = Screen.ActiveForm.ScaleY(Picture.height, vbHimetric, vbPixels)
                                                                            'The height of the surface is set by scaling from the stdpicture objects vbhimetric scale mode to pixels
    End With
    Set dds = dd.CreateSurface(ddsd)                                        'Create the surface
    hdcPicture = CreateCompatibleDC(ByVal 0&)                               'Create a memory device context
    SelectObject hdcPicture, Picture.Handle                                 'Select the bitmap into this memory device
    dds.restore                                                             'Restore the surface
    hdcSurface = dds.GetDC                                                  'Get the surface's DC
    StretchBlt hdcSurface, 0, 0, ddsd.lWidth, ddsd.lHeight, hdcPicture, 0, 0, Screen.ActiveForm.ScaleX(Picture.width, vbHimetric, vbPixels), Screen.ActiveForm.ScaleY(Picture.height, vbHimetric, vbPixels), SRCCOPY
                                                                            'Copy from the memory device to the DirectDrawSurface
    dds.ReleaseDC hdcSurface                                                'Release the surface's DC
    DeleteDC hdcPicture                                                     'Release the memory device context
    Set Picture = Nothing                                                   'Release the picture object
    Set CreateDDSFromFile = dds                                           'Sets the function to the newly created direct draw surface
    
End Function

'                     from 1!! 0=nodata    from 1!!

Public Sub PrintFrame(brushnr As Integer, FrameNr As Integer, x As Integer, y As Integer)
Dim r As RECT
r.Top = brushnr * BrushHeight
r.Left = (FrameNr - 1) * BrushWidth
r.Bottom = r.Top + BrushHeight
r.Right = r.Left + BrushWidth

Call backbuffer.BltFast(BrushWidth + x, BrushHeight + y, Surface, r, DDBLTFAST_WAIT)
End Sub


Public Sub NextFrame(brushnr As Integer, x As Integer, y As Integer)

Dim r As RECT
r.Top = brushnr * BrushHeight
r.Left = (NextFrameNr(brushnr) - 1) * BrushWidth
r.Bottom = r.Top + BrushHeight
r.Right = r.Left + BrushWidth

Call backbuffer.BltFast(BrushWidth + x, BrushHeight + y, Surface, r, DDBLTFAST_WAIT)

If FrameNr(brushnr) <> 1 Then
 If NextFrameNr(brushnr) < FrameNr(brushnr) Then
   NextFrameNr(brushnr) = NextFrameNr(brushnr) + 1
 Else:
   NextFrameNr(brushnr) = 1
 End If
End If
End Sub


Public Function GetLastFrameNr(brushnr As Integer) As Integer
If NextFrameNr(brushnr) <> 1 Then
 GetLastFrameNr = NextFrameNr(brushnr) - 1
Else
 GetLastFrameNr = FrameNr(brushnr)
End If
End Function

Public Sub SetNextFrameNr(brushnr As Integer, NextFrame As Integer)
  NextFrameNr(brushnr) = NextFrame
End Sub
                                        
Public Function GetNextFrame(brushnr As Integer) As Integer
  GetNextFrame = NextFrameNr(brushnr)
End Function

Public Sub SetBrushesNextFrame(jump As Integer)
  Dim i As Integer
  For i = 1 To MaxBrush
    NextFrameNr(i) = NextFrameNr(i) + jump
    If NextFrameNr(i) > FrameNr(i) Then NextFrameNr(i) = 1
  Next
End Sub

Public Function GetMaxFrame(brushnr As Integer) As Integer
  GetMaxFrame = FrameNr(brushnr)
End Function
