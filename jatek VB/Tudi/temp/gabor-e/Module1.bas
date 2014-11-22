Attribute VB_Name = "GaborKonst"
Option Explicit
Public Const MaxBrush = 4

'Public Const BrushSize = 30
'mekkora a brush

Public Const BrushWidth = 30
Public Const BrushHeight = 30
'load them from the ini file
Public Const BrushMaxX = 25
Public Const BrushMaxY = 25
Public Const VisibleBrushWidth = 20
Public Const VisibleBrushHeight = 20


Public Const Inc_Size = 10

'key codes
Public Const K_Up = 38
Public Const K_Down = 40
Public Const K_Right = 39
Public Const K_Left = 37
Public Const K_F3 = 114
Public Const K_Esc = 27
Public Const K_Del = 46
Public Const K_Ins = 45

Public Const K_A = 65
Public Const K_S = 83
Public Const K_M = 77
Public Const K_R = 82
Public Const K_C = 67
Public Const K_P = 80
Public Const K_Q = 81
Public Const K_T = 84
Public Const K_Plus = 107
Public Const K_Minus = 109
Public Const K_Csillag = 106


Public cx1 As Integer
Public cy1 As Integer


Public Function GetRealX(virtx As Integer) As Integer
GetRealX = virtx - cx1
End Function

Public Function GetRealY(virty As Integer) As Integer
GetRealY = virty - cy1
End Function

Public Function GetVirtX(realx As Integer) As Integer
GetVirtX = cx1 + realx
End Function

Public Function GetVirtY(realy As Integer) As Integer
GetVirtY = cy1 + realy
End Function

