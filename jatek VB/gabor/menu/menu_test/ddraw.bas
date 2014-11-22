Attribute VB_Name = "DDraw"
Option Explicit
'Do not change the names of the variables
'the other parts of the code will not work
Public Const SRCCOPY = &HCC0020

Public dx As New DirectX7
Public dd As DirectDraw7
Public primary As DirectDrawSurface7
Public backbuffer As DirectDrawSurface7

Public DDClip          As DirectDrawClipper
Public ddsdPrimary     As DDSURFACEDESC2
Public ddsdBackBuffer  As DDSURFACEDESC2

Public ddsd1 As DDSURFACEDESC2
Public ddsd2 As DDSURFACEDESC2
Public ddsd3 As DDSURFACEDESC2
Public ddsd4 As DDSURFACEDESC2

' move these tho somewere else !!!
Public MouseX As Integer
Public MouseY As Integer
Public MouseButton As Integer
'only for testing
Public Const BrushWidth = 30
Public Const BrushHeight = 30



Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
                                        'used to create a DC for reading in and creating a direct draw surface from other formats besides .bmp
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
                                        'used to select the dc into an object
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
                                        'used to blit the bitmap from a dc to a direct draw surface
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long


Function ExModeActive() As Boolean
    Dim TestCoopRes As Long
    
    TestCoopRes = dd.TestCooperativeLevel
    
    If (TestCoopRes = DD_OK) Then
        ExModeActive = True
    Else
        ExModeActive = False
    End If
    
End Function

Public Function CreateDDSFromFile(ByVal strFile As String, ByVal dd As DirectDraw7, Optional VideoMem As Boolean) As DirectDrawSurface7
    
    'This function creates a direct draw surface from any valid file format that loadpicture uses, and returns
    'the newly created surface
    
' not cheching input ... asuming ok by programer

    
'    If Dir(strFile) = "" Then                                               'If the file doesn't exist
'        DisplayError Err.Number, "Unable to create " & strFile & " as a Direct Draw surface." & vbCrLf & "Check to ensure this file exists and is in the same directory as Space Shooter.exe, and is a valid bitmap."
'                                                                            'Send the displayerror sub the error message and location the error occurred
'    End If
    
    Dim ddsd As DDSURFACEDESC2                                              'Surface description
    Dim dds As DirectDrawSurface7                                           'Created surface
    Dim hdcPicture As Long                                                  'Device context for picture
    Dim hdcSurface As Long                                                  'Device context for surface
    Dim Picture As StdPicture                                               'stdole2 StdPicture object
    
';ds
Set Picture = LoadPicture(strFile)                                      'Load the bitmap
    
    With ddsd                                                               'Fill the surface description
        .lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH                    'Tell Direct Draw that the caps element is valid, the height element is valid, and the width element is valid
        If VideoMem Then                                                    'If the videomem flag is set, then
            .ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_VIDEOMEMORY  'Create the surface in video memory
        Else
            .ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY 'Otherwise, creat the surface in system memory
        End If
        .lWidth = Screen.ActiveForm.ScaleX(Picture.Width, vbHimetric, vbPixels)
                                                                            'The width of the surface is set by scaling from the stdpicture objects vbhimetric scale mode to pixels
        .lHeight = Screen.ActiveForm.ScaleY(Picture.Height, vbHimetric, vbPixels)
                                                                            'The height of the surface is set by scaling from the stdpicture objects vbhimetric scale mode to pixels
    End With
    Set dds = dd.CreateSurface(ddsd)                                        'Create the surface
    hdcPicture = CreateCompatibleDC(ByVal 0&)                               'Create a memory device context
    SelectObject hdcPicture, Picture.Handle                                 'Select the bitmap into this memory device
    dds.restore                                                             'Restore the surface
    hdcSurface = dds.GetDC                                                  'Get the surface's DC
    StretchBlt hdcSurface, 0, 0, ddsd.lWidth, ddsd.lHeight, hdcPicture, 0, 0, Screen.ActiveForm.ScaleX(Picture.Width, vbHimetric, vbPixels), Screen.ActiveForm.ScaleY(Picture.Height, vbHimetric, vbPixels), SRCCOPY
                                                                            'Copy from the memory device to the DirectDrawSurface
    dds.ReleaseDC hdcSurface                                                'Release the surface's DC
    DeleteDC hdcPicture                                                     'Release the memory device context
    Set Picture = Nothing                                                   'Release the picture object
    Set CreateDDSFromFile = dds                                           'Sets the function to the newly created direct draw surface
    
End Function



Public Sub Destroy_DDraw()
Set backbuffer = Nothing
Set primary = Nothing
Set dd = Nothing
Set dx = Nothing
End Sub

