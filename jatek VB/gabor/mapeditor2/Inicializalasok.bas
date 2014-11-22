Attribute VB_Name = "Fuggvenyek"
Option Explicit

Public Sub InitAll()
 Path = CurDir
 Path = "c:\mystuff\jatek\tudi\mapeditor2"
 cx1 = 0
 cy1 = 0
 CreateGameSettings
 'LoadGameSettings
 'LoadDefaultBrushSettings
 CreateDefaultBrushSettings
 InitVariables
 ShowMinimap
 ShowSelecBrush
 ShowBrushProp
 F_Main.M_Animate.Checked = False
 F_Main.M_Grid.Checked = False
 Init_Ddraw
 LoadBrushImg
 ShowMap
 F_Map.Cls
 RefreshMap
End Sub

Private Sub ShowMap()
  F_Map.Left = F_Main.Left + 100
  F_Map.Top = F_Minimap.Top
  'Me.width = 6000 - 130
  'Me.height = 6000 - 130
  F_Map.height = F_Main.height - 750
  F_Map.width = F_Main.width - F_Minimap.width - 250
  F_Map.Show
End Sub

Private Sub ShowSelecBrush()
 F_SelectBrush.Top = F_Minimap.Top + F_Minimap.height
 F_SelectBrush.Left = F_Minimap.Left + F_Minimap.width - F_SelectBrush.width
 F_SelectBrush.Show
End Sub

Private Sub InitVariables()
End Sub

Public Sub LoadDefaultBrushSettings()
 'inicializalja a brushoknak a tulajdonsagait
 Dim i As Integer
 Open Path + PathDefBrushsetting For Random As #1 Len = Len(VBrush(1))
   For i = 1 To MaxVBrush
     Get #1, , VBrush(i)
   Next
 Close #1
End Sub

Private Sub CreateDefaultBrushSettings()
 Dim i As Integer
 'ezt fellodolja minden uj map loadolas,ujrahozaskor
 For i = 1 To MaxVBrush
   VBrush(i).Index = i
   VBrush(i).r = i
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
   For i = 1 To MaxVBrush
     Put #1, , VBrush(i)
   Next
 Close #1
End Sub

Private Sub CreateGameSettings()
  'a jatekra vonatkozo mindig ugyanazok az erteku valtozokat loadolja fel
'  path = CurDir + PathSettings
'  Path = "c:\mystuff\jatek\tudi\mapeditor"
  Version1 = 1
  Version2 = 1
  BrushX = BrushWidth
  BrushY = BrushHeight
'  Open Path + PathSettings For Output As #1
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
   Dim Color As Long
  'a valtozok elokeszitese
  width = F_Minimap.ScaleWidth
  height = F_Minimap.ScaleHeight
  'pixel-el szeretnenk rajzolni
  F_Minimap.ScaleMode = 3
  If (MHeader.x < MinMapX) Then MHeader.x = MinMapX
  If (MHeader.y < MinMapY) Then MHeader.y = MinMapY
  If (MHeader.x > MaxMapX) Then MHeader.x = MaxMapX
  If (MHeader.y > MaxMapY) Then MHeader.y = MaxMapY
  'a leptekek
  PX = MHeader.x / width
  PY = MHeader.y / height
  Color = PX * 12
  For i = 0 To height
    For j = 0 To width
      Color = RGB(VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).r, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).G, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).B)
'      color = RGB(VBrush(j Mod MaxvBrush).R, VBrush(j Mod MaxvBrush).G, VBrush(j Mod MaxvBrush).B)
'      color = RGB(2, 2, 2)
      F_Minimap.PSet (j, i), Color
    Next
  Next
End Sub

Public Sub SaveMap()
  Dim i As Integer
  Dim j As Integer
  Dim nr As Integer
  Dim v(MaxVBrush) As Byte
  'nezzuk meg melyik brushokat hasznalja a terkep es mentsuk le azokat
  For i = 1 To MaxVBrush
    v(i) = 0
  Next
  For i = 1 To MHeader.y
    For j = 1 To MHeader.x
      v(MMap(i, j)) = 1
    Next
  Next
  nr = 0
  Open Path + PathMap + Name + ".bdt" For Random As #1 Len = Len(VBrush(1))
    For i = 1 To MaxVBrush
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
      For i = 1 To MHeader.y
        For j = 1 To MHeader.x
          Put #1, , MMap(i, j)
        Next
      Next
    End If
    'van kulonleges fog terkep ? ha igen mentsuk le
    If MHeader.MFog = 1 Then
      For i = 1 To MHeader.y
        For j = 1 To MHeader.x
          Write #1, MFog(i, j)
        Next
      Next
    End If
    'van kulonleges magasag terkep? ha igen akkor mentsuk le
    If MHeader.MHeight = 1 Then
      For i = 1 To MHeader.y
        For j = 1 To MHeader.x
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
     For i = 1 To MHeader.y
       For j = 1 To MHeader.x
         Get #1, , MMap(i, j)
       Next
     Next
    End If
    If MHeader.MFog = 1 Then
     For i = 1 To MHeader.y
       For j = 1 To MHeader.x
         Get #1, , MFog(i, j)
       Next
     Next
    End If
    If MHeader.MHeight = 1 Then
     For i = 1 To MHeader.y
       For j = 1 To MHeader.x
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


Sub Init_Ddraw()
    Dim file As String
    Set dd = dx.DirectDrawCreate("")
    F_Map.Show
    Call dd.SetCooperativeLevel(F_Map.hWnd, DDSCL_NORMAL)
    ddsdPrimary.lFlags = DDSD_CAPS
    ddsdPrimary.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE
    Set primary = dd.CreateSurface(ddsdPrimary)
  '  Set DDClip = dd.CreateClipper(0)
  '  DDClip.SetHWnd Me.hWnd
  '  primary.SetClipper DDClip
    ddsdBackBuffer.lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH
    ddsdBackBuffer.ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY
    'MsgBox Me.Width
    ddsdBackBuffer.lWidth = VisibleBrushWidth * BrushWidth + 2 * BrushWidth
    ddsdBackBuffer.lHeight = VisibleBrushHeight * BrushHeight + 2 * BrushHeight
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
End Sub

Private Sub LoadBrushImg()
  Dim frmn(MaxBrush) As Integer
  Dim s As String
  Dim i As Integer
  Dim j As Integer
  cx1 = 0
  cy1 = 0
  i = 0
  Open Path + "\settings\frames.dat" For Input As #1
  Do While Not (EOF(1))
   i = i + 1
   Input #1, s
   frmn(i) = Int(s)
  Loop
  Close 1
  For j = i + 1 To MaxBrush
    frmn(j) = 1
  Next
  frmn(MaxBrush - 1) = 1
  frmn(MaxBrush) = 1
  kep.Init Path + "\settings\brushimg5.jpg", MaxBrush, frmn
  F_Map.Cls
  RefreshMap
End Sub

Private Sub ShowBrushProp()
  F_BProp.Top = F_SelectBrush.Top + F_SelectBrush.height
  F_BProp.Left = F_Minimap.Left
  F_BProp.width = F_Minimap.width
  F_BProp.height = F_Main.height - F_Minimap.height - F_SelectBrush.height - 750
  F_BProp.Show
End Sub


Public Sub RefreshMap1()
'  Dim i As Integer
'  Dim j As Integer
'  Dim rs As RECT
'  Dim rd As RECT
'  dx.GetWindowRect F_Map.hWnd, rd
'  rs.Left = BrushWidth
'  rs.Top = BrushHeight
'  rs.Bottom = rd.Bottom - rd.Top + BrushHeight
'  rs.Right = rd.Right - rd.Left + BrushWidth
'  'toroljuk le a regi buffert
'  backbuffer.SetFillColor (QBColor(8))
'  backbuffer.DrawBox BrushWidth, BrushHeight, BrushWidth + VisibleBrushWidth * BrushWidth + 1, BrushHeight + VisibleBrushHeight * BrushHeight + 1
'  kep.SetBrushesNextFrame 1
'  For i = 1 To MHeader.y
'   For j = 1 To MHeader.x
'     If MMap(i, j) = 0 Then
'       kep.PrintFrame NoData, kep.GetNextFrame(NoData), (j - 1) * BrushWidth - cx1, (i - 1) * BrushWidth - cy1
'       Else: kep.PrintFrame MMap(i, j), kep.GetNextFrame(MMap(i, j)), (j - 1) * BrushWidth - cx1, (i - 1) * BrushHeight - cy1
'     End If
'   Next j
'  Next i
' If F_Main.M_Grid.Checked = True Then DrawMapGrid
' primary.Blt rd, backbuffer, rs, DDBLT_WAIT
End Sub

Sub RefreshMap()
  Dim i As Integer
  Dim j As Integer
  Dim rs As RECT
  Dim rd As RECT
  dx.GetWindowRect F_Map.hWnd, rd
  rs.Left = BrushWidth
  rs.Top = BrushHeight
  rs.Bottom = rd.Bottom - rd.Top + BrushHeight
  rs.Right = rd.Right - rd.Left + BrushWidth
  'toroljuk le a regi buffert
  backbuffer.SetFillColor (QBColor(0))
  backbuffer.DrawBox BrushWidth, BrushHeight, BrushWidth + VisibleBrushWidth * BrushWidth + 1, BrushHeight + VisibleBrushHeight * BrushHeight + 1

'kep.SetBrushNextFrame (1)
For i = cx1 \ BrushWidth + 1 To MHeader.x
 For j = cy1 \ BrushHeight + 1 To MHeader.y
    'If MMap(j, i) = 0 Then
    'kep.PrintFrame NoData, kep.GetNextFrame(NoData), GetRealX((i - 1) * BrushWidth), GetRealY((j - 1) * BrushHeight)
    'Else
    kep.PrintFrame MMap(j, i), kep.GetNextFrame(MMap(j, i)), GetRealX((i - 1) * BrushWidth), GetRealY((j - 1) * BrushHeight)
    'End If
 Next j
Next i
'draw grid if enabled
If F_Main.M_Grid.Checked = True Then DrawMapGrid

 primary.Blt rd, backbuffer, rs, DDBLT_WAIT
End Sub



Sub DrawMapGrid()
Dim i As Integer
backbuffer.SetForeColor (QBColor(7))
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

