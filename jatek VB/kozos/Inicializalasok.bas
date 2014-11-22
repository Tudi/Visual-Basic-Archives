Attribute VB_Name = "Fuggvenyek"
Option Explicit

Public Sub InitAll()
 CreateGameSettings
 'LoadGameSettings
 'LoadDefaultBrushSettings
 CreateDefaultBrushSettings
 InitVariables
 ShowMinimap
End Sub

Private Sub InitVariables()
End Sub

Public Sub LoadDefaultBrushSettings()
 'inicializalja a brushoknak a tulajdonsagait
 Dim i As Integer
 Open Path + PathDefBrushsetting For Random As #1 Len = Len(VBrush(1))
   For i = 1 To MaxBrush
     Get #1, , VBrush(i)
   Next
 Close #1
End Sub

Private Sub CreateDefaultBrushSettings()
 Dim i As Integer
 'ezt fellodolja minden uj map loadolas,ujrahozaskor
 For i = 1 To MaxBrush
   VBrush(i).Index = i
   VBrush(i).R = i
   VBrush(i).G = (2 * i) Mod 255
   VBrush(i).B = (4 * i) Mod 255
   VBrush(i).Atack = 0
   VBrush(i).Def = 0
   VBrush(i).NrFrame = 0
   VBrush(i).Speed = 0
   VBrush(i).Vrange = 0
   VBrush(i).Wrange = 0
   VBrush(i).Hide = 0
 Next
 Open Path + PathDefBrushsetting For Random As #1 Len = Len(VBrush(1))
   For i = 1 To MaxBrush
     Put #1, , VBrush(i)
   Next
 Close #1
End Sub

Private Sub CreateGameSettings()
  'a jatekra vonatkozo mindig ugyanazok az erteku valtozokat loadolja fel
'  path = CurDir + PathSettings
  Path = "c:\mystuff\jatek\tudi\mapeditor"
  Version1 = 1
  Version2 = 1
  BrushX = BrushWidth
  BrushY = BrushHeight
  Open Path + PathSettings For Output As #1
    'a ket verzio szam
    Write #1, Version1
    Write #1, Version2
    'egy brush szelesege
    Write #1, BrushX
    'egy brush hossza
    Write #1, BrushY
  Close #1
End Sub

Private Sub LoadGameSettings()
  'a jatekra vonatkozo mindig ugyanazok az erteku valtozokat loadolja fel
  Dim Path As String
'  path = CurDir + PathSettings
  Path = "c:\mystuff\jatek\tudi\mapeditor" + PathSettings
  Open Path For Input As #1
    'a ket verzio szam
    Input #1, Version1
    Input #1, Version2
    Input #1, BrushX
    Input #1, BrushY
  Close #1
End Sub

Private Sub ShowMinimap()
    F_Minimap.width = MiniMap_Width
    F_Minimap.height = MiniMap_Height
    F_Minimap.Left = F_Main.width - F_Minimap.width - 200
    F_Minimap.Top = 0
    F_Minimap.Show
End Sub

Public Function twip2pixel(twip As Integer) As Integer
  twip2pixel = twip / 15
End Function

Public Sub ReloadMiniMap()
   Dim PX As Single
   Dim PY As Single
   Dim width As Single
   Dim height As Single
   Dim i As Single
   Dim j As Single
   Dim color As Long
  'a valtozok elokeszitese
  width = F_Minimap.ScaleWidth
  height = F_Minimap.ScaleHeight
  'pixel-el szeretnenk rajzolni
  F_Minimap.ScaleMode = 3
  If (MHeader.X < MinMapX) Then MHeader.X = MinMapX
  If (MHeader.Y < MinMapY) Then MHeader.Y = MinMapY
  If (MHeader.X > MaxMapX) Then MHeader.X = MaxMapX
  If (MHeader.Y > MaxMapY) Then MHeader.Y = MaxMapY
  'a leptekek
  PX = MHeader.X / width
  PY = MHeader.Y / height
  color = PX * 12
  For i = 0 To height
    For j = 0 To width
      color = RGB(VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).R, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).G, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).B)
'      color = RGB(VBrush(j Mod MaxBrush).R, VBrush(j Mod MaxBrush).G, VBrush(j Mod MaxBrush).B)
'      color = RGB(2, 2, 2)
      F_Minimap.PSet (j, i), color
    Next
  Next
End Sub

Public Sub SaveMap()
  Dim i As Integer
  Dim j As Integer
  Dim nr As Integer
  Dim v(MaxBrush) As Byte
  'nezzuk meg melyik brushokat hasznalja a terkep es mentsuk le azokat
  For i = 1 To MaxBrush
    v(i) = 0
  Next
  For i = 1 To MHeader.Y
    For j = 1 To MHeader.X
      v(MMap(i, j)) = 1
    Next
  Next
  nr = 0
  Open Path + PathMap + Name + ".bdt" For Random As #1 Len = Len(VBrush(1))
    For i = 1 To MaxBrush
      If v(i) <> 0 Then
        'a brush indexje
        Put #1, , VBrush(i)
        nr = nr + 1
      End If
    Next
  Close #1
  'a nr tarolja hany brusht hasznal ez a terkep
  MHeader.NrBrush = nr
  'mentsuk le a map headerjet is
  Open Path + PathMap + Name + ".mdt" For Random As #1 Len = Len(MHeader)
    Put #1, , MHeader
  Close #1
  'most mentsuk le maga a terkepeket is,mar amelyik van
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(MMap(1, 1))
    'van hatter terkep ? ha igen akkor mentsuk le
    If MHeader.MMap = 1 Then
      For i = 1 To MHeader.Y
        For j = 1 To MHeader.X
          Put #1, , MMap(i, j)
        Next
      Next
    End If
    'van kulonleges fog terkep ? ha igen mentsuk le
    If MHeader.MFog = 1 Then
      For i = 1 To MHeader.Y
        For j = 1 To MHeader.X
          Write #1, MFog(i, j)
        Next
      Next
    End If
    'van kulonleges magasag terkep? ha igen akkor mentsuk le
    If MHeader.MHeight = 1 Then
      For i = 1 To MHeader.Y
        For j = 1 To MHeader.X
          Write #1, MHeight(i, j)
        Next
      Next
    End If
  Close #1
 'mentsuk le a unitokat
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VUnit(1))
    For i = 1 To MHeader.NrUnit
      Put #1, , VUnit(i)
    Next
  Close #1
  'mentsuk le a varosokat
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VCity(1))
    For i = 1 To MHeader.NrCity
      Put #1, , VCity(i)
    Next
  Close #1
 'mentsuk le a banyakat
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VMine(1))
    For i = 1 To MHeader.NrMine
      Put #1, , VMine(i)
    Next
  Close #1
End Sub

Public Sub LoadMap(s As String)
  Dim i As Integer
  Dim j As Integer
  'eloszor szuksegunk van a file nevere es a header-re
  Name = Mid(s, 1, Len(s) - 4)
  Open Path + PathMap + Name + ".mdt" For Random As #1 Len = Len(MHeader)
    Get #1, 1, MHeader
  Close #1
  Open Path + PathMap + Name + ".bdt" For Random As #1 Len = Len(VBrush(1))
    For i = 1 To MHeader.NrBrush
      Get #1, , VBrush(0)
      VBrush(VBrush(0).Index) = VBrush(0)
    Next
  Close #1
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(MMap(1, 1))
    If MHeader.MMap = 1 Then
     For i = 1 To MHeader.Y
       For j = 1 To MHeader.X
         Get #1, , MMap(i, j)
       Next
     Next
    End If
    If MHeader.MFog = 1 Then
     For i = 1 To MHeader.Y
       For j = 1 To MHeader.X
         Get #1, , MFog(i, j)
       Next
     Next
    End If
    If MHeader.MHeight = 1 Then
     For i = 1 To MHeader.Y
       For j = 1 To MHeader.X
         Get #1, , MHeight(i, j)
       Next
     Next
    End If
  Close #1
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VUnit(1))
    For i = 1 To MHeader.NrUnit
      Put #1, , VUnit(i)
    Next
  Close #1
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VCity(1))
    For i = 1 To MHeader.NrCity
      Put #1, , VCity(i)
    Next
  Close #1
  Open Path + PathMap + Name + ".map" For Random As #1 Len = Len(VMine(1))
    For i = 1 To MHeader.NrMine
      Put #1, , VMine(i)
    Next
  Close #1
  ReloadMiniMap
End Sub
