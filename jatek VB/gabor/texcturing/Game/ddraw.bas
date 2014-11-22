Attribute VB_Name = "Module1"
Option Explicit
'Do not change the names of the variables
'the other parts of the code will not work
Public Const SRCCOPY = &HCC0020

Public dx As New DirectX7
Public dd As DirectDraw7
Public primary As DirectDrawSurface7
Public backbuffer As DirectDrawSurface7

Public ddsd1 As DDSURFACEDESC2
Public ddsd2 As DDSURFACEDESC2
Public ddsd3 As DDSURFACEDESC2
Public ddsd4 As DDSURFACEDESC2



Function ExModeActive() As Boolean
    Dim TestCoopRes As Long
    
    TestCoopRes = dd.TestCooperativeLevel
    
    If (TestCoopRes = DD_OK) Then
        ExModeActive = True
    Else
        ExModeActive = False
    End If
    
End Function


