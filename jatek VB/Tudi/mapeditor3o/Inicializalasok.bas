Attribute VB_Name = "Fuggvenyek"
Option Explicit

Public Sub InitAll()
' Path = CurDir
 Path = "c:\mystuff\jatek\tudi\mapeditor3"
' CreateGameSettings
 LoadGameSettings
' CreateDefaultBrushSettings
 LoadDefaultBrushSettings
 InitVariables
 ShowMinimap
 ShowSelecBrush
 ShowBrushProp
 ShowGetColor
 F_Main.M_Animate.Checked = False
 F_Main.M_Grid.Checked = False
 ShowMap
 VisibleBrushHeight = F_Map.ScaleHeight \ BrushHeight + 1
 VisibleBrushWidth = F_Map.ScaleWidth \ BrushWidth + 1
 Init_Ddraw
 LoadBrushImg
 F_Map.Cls
 RefreshMap
End Sub

Public Sub RefreshProperties()
  F_BProp.Text1.Text = VBrush(SelectedBrush).CanMove
  F_BProp.Text2.Text = VBrush(SelectedBrush).CanFly
  F_BProp.Text3.Text = VBrush(SelectedBrush).CanSwim
  F_BProp.Text4.Text = VBrush(SelectedBrush).Height
  F_BProp.Text5.Text = VBrush(SelectedBrush).CanBuild
  F_BProp.Text6.Text = VBrush(SelectedBrush).Def
  F_BProp.Text7.Text = VBrush(SelectedBrush).Atack
  F_BProp.Text8.Text = VBrush(SelectedBrush).Speed
  F_BProp.Text9.Text = VBrush(SelectedBrush).Vrange
  F_BProp.Text10.Text = VBrush(SelectedBrush).Wrange
  F_BProp.Text11.Text = VBrush(SelectedBrush).Hide
  F_BProp.Text12.Text = VBrush(SelectedBrush).Mineral
End Sub

Private Sub ShowMap()
  F_Map.Left = F_Main.Left + 100
  F_Map.Top = F_Minimap.Top
  F_Map.Height = F_Main.Height - 750
  F_Map.width = F_Main.width - F_Minimap.width - 250
  F_Map.Show
End Sub

Private Sub ShowGetColor()
 F_GetColor.Top = F_Minimap.Top + F_Minimap.Height
 F_GetColor.Left = F_Minimap.Left
 F_GetColor.Show
End Sub

Private Sub ShowSelecBrush()
 F_SelectBrush.Top = F_Minimap.Top + F_Minimap.Height
 F_SelectBrush.Left = F_Minimap.Left + F_Minimap.width - F_SelectBrush.width
 F_SelectBrush.Show
End Sub

Private Sub InitVariables()
  cx1 = 0
  cy1 = 0
  If (MHeader.x < MinMapX) Then MHeader.x = MinMapX
  If (MHeader.y < MinMapY) Then MHeader.y = MinMapY
  If (MHeader.x > MaxMapX) Then MHeader.x = MaxMapX
  If (MHeader.y > MaxMapY) Then MHeader.y = MaxMapY
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
   VBrush(i).Speed = 0
   VBrush(i).Vrange = 0
   VBrush(i).Wrange = 0
   VBrush(i).Hide = 0
   VBrush(i).CanFly = 1
   VBrush(i).CanMove = 1
   VBrush(i).CanSwim = 0
   VBrush(i).Height = 0
   VBrush(i).NrFrames = 0
 Next
 Open Path + PathDefBrushsetting For Random As #1 Len = Len(VBrush(1))
   For i = 1 To MaxVBrush
     Put #1, , VBrush(i)
   Next
 Close #1
End Sub

Private Sub CreateGameSettings()
  'a jatekra vonatkozo mindig ugyanazok az erteku valtozokat loadolja fel
  Version1 = 1
  Version2 = 1
  Open Path + PathSettings For Output As #1
    'a ket verzio szam
    Write #1, Version1
    Write #1, Version2
    'egy brush szelesege
    Write #1, BrushWidth
    'egy brush hossza
    Write #1, BrushHeight
  Close #1
End Sub

Private Sub LoadGameSettings()
  'a jatekra vonatkozo mindig ugyanazok az erteku valtozokat loadolja fel
  Open Path + PathSettings For Input As #1
    'a ket verzio szam
    Input #1, Version1
    Input #1, Version2
    Input #1, BrushWidth
    Input #1, BrushHeight
  Close #1
End Sub

Private Sub ShowMinimap()
    F_Minimap.width = MiniMap_Width
    F_Minimap.Height = MiniMap_Height
    F_Minimap.Left = F_Main.width - F_Minimap.width - 200
    F_Minimap.Top = 0
    F_Minimap.Show
End Sub

Public Function twip2pixel(twip As Integer) As Integer
  twip2pixel = twip / 15
End Function

Public Sub RefreshMiniMap()
  Dim rs As RECT
  Dim rd As RECT
  Dim MapPX As Single
  Dim MapPY As Single
  Dim px As Single
  Dim py As Single
  Dim width As Single
  Dim Height As Single
  Dim r As Integer
  Dim i As Single
  Dim j As Single
  Dim k As Integer
  Dim l As Integer
  Dim Color As Long
  Dim brushnr As Integer
  dx.GetWindowRect F_Minimap.hWnd, rd
  rs.Left = 0
  rs.Top = 0
  rs.Bottom = F_Minimap.ScaleHeight
  rs.Right = F_Minimap.ScaleWidth
  'toroljuk le a regi buffert
'  backbuffer.SetFillColor (QBColor(0))
'  backbuffer.DrawBox 0, 0, F_Minimap.ScaleWidth + 2 * BrushWidth, F_Minimap.ScaleHeight + 2 * BrushHeight
'  'a valtozok elokeszitese
  If F_Minimap.ScaleWidth > MHeader.x Then
    width = MHeader.x
    px = F_Minimap.ScaleWidth / MHeader.x
    MapPX = 1
    Else: width = F_Minimap.ScaleWidth
          MapPX = MHeader.x / F_Minimap.ScaleWidth
          px = 1
  End If
  If F_Minimap.ScaleHeight > MHeader.y Then
    Height = MHeader.y
    py = F_Minimap.ScaleHeight / MHeader.y
    MapPY = 1
    Else: Height = F_Minimap.ScaleHeight
          MapPY = MHeader.y / F_Minimap.ScaleHeight
          py = 1
  End If
  If py > px Then
    r = py / 2
    Else: r = px / 2
  End If
'  backbuffer.Lock rs, ddsdPrimary, DDLOCK_WAIT, 0
  backbuffer.Lock rs, ddsdBackBuffer, DDLOCK_WAIT, 0
  For i = 0 To Height
    For j = 0 To width
'      backbuffer.SetFillColor RGB(VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).r, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).G, VBrush(MMap(Int(i * PY) + 1, Int(j * PX) + 1)).B)
      brushnr = MMap(i * MapPY + 1, j * MapPX + 1)
      Color = RGB(VBrush(brushnr).B, VBrush(brushnr).G, VBrush(brushnr).r)
'      Color = RGB(0, 0, 255)
'      color = VBrush(brushnr).reserved
      For k = i * py - r To i * py + r
        For l = j * px - r To j * px + r
         backbuffer.SetLockedPixel l + r, k + r, Color
        Next l
      Next k
    Next j
  Next i
  backbuffer.Unlock rs
  'rajzoljuk ki a minimapre a virtualis screent
  backbuffer.setDrawWidth 2
  backbuffer.SetForeColor MiniMapbeKocka
  backbuffer.SetFillStyle 1
  backbuffer.DrawBox cx1 / BrushWidth * px, cy1 / BrushHeight * py, (cx1 + F_Map.ScaleWidth) / BrushWidth * px, (cy1 + F_Map.ScaleHeight) / BrushHeight * py
  'draw grid if enabled
'  If F_Main.M_Grid.Checked = True Then DrawMapGrid
  'copy videobuffer to targetbuffer
  primary.Blt rd, backbuffer, rs, DDBLT_WAIT
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
  cx1 = 0
  cy1 = 0
  'loadoljuk a default brush settingeket
  LoadDefaultBrushSettings
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
End Sub


Sub Init_Ddraw()
    Dim file As String
    Dim sd As DDSURFACEDESC2
    Set dd = dx.DirectDrawCreate("")
    F_Map.Show
    Call dd.SetCooperativeLevel(F_Main.hWnd, DDSCL_NORMAL)
    dd.GetDisplayMode sd
    If sd.ddpfPixelFormat.lRGBBitCount < 24 Then
     MsgBox "Set your bpp to 24 or hier"
     End 'exits program or something like that.
    End If
     
    'dd.SetDisplayMode sd.lWidth, sd.lHeight, 24, 0, DDSDM_DEFAULT
'    dd.SetDisplayMode sd.lWidth, sd.lHeight, 16, 0, DDSDM_DEFAULT
    ddsdPrimary.lFlags = DDSD_CAPS
    ddsdPrimary.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE
    Set primary = dd.CreateSurface(ddsdPrimary)
    ddsdBackBuffer.lFlags = DDSD_CAPS Or DDSD_HEIGHT Or DDSD_WIDTH
    ddsdBackBuffer.ddsCaps.lCaps = DDSCAPS_OFFSCREENPLAIN Or DDSCAPS_SYSTEMMEMORY
    ddsdBackBuffer.lWidth = F_Map.ScaleWidth + 3 * BrushWidth
    ddsdBackBuffer.lHeight = F_Map.ScaleHeight + 3 * BrushHeight
    Set backbuffer = dd.CreateSurface(ddsdBackBuffer)
End Sub

Private Sub LoadBrushImg()
  Dim frmn(MaxBrush) As Integer
  Dim s As String
  Dim i As Integer
  Dim j As Integer
  cx1 = 0
  cy1 = 0
  VBrush(0).NrFrames = 1
  Open Path + "\settings\frames.dat" For Input As #1
  i = 0
  Do While Not (EOF(1))
   i = i + 1
   Input #1, s
   frmn(i) = Int(s)
   VBrush(i).NrFrames = frmn(i)
  Loop
  Close 1
  For j = i + 1 To MaxBrush
    frmn(j) = 1
  Next
  kep.Init Path + PathBrushImg, MaxBrush, frmn
  'kep.Init Path + PathBrushImg, 20, frmn
  F_Map.Cls
  RefreshMap
End Sub

Private Sub ShowBrushProp()
  F_BProp.Top = F_SelectBrush.Top + F_SelectBrush.Height
  F_BProp.Left = F_Minimap.Left
  F_BProp.width = F_Minimap.width
  F_BProp.Height = F_Main.Height - F_Minimap.Height - F_SelectBrush.Height - 750
  F_BProp.Show
End Sub

Public Sub RefreshMap()
  Dim i As Integer
  Dim j As Integer
  Dim rs As RECT
  Dim rd As RECT
  Dim tx As Integer
  Dim ty As Integer
  dx.GetWindowRect F_Map.hWnd, rd
  rs.Left = BrushWidth
  rs.Top = BrushHeight
  rs.Bottom = rd.Bottom - rd.Top + BrushHeight
  rs.Right = rd.Right - rd.Left + BrushWidth
  'toroljuk le a regi buffert
  backbuffer.SetFillStyle 0
  backbuffer.SetFillColor (QBColor(0))
  backbuffer.DrawBox 0, 0, F_Map.ScaleWidth + 2 * BrushWidth, F_Map.ScaleHeight + 2 * BrushHeight
  'kep.SetBrushNextFrame (1)
  tx = (cx1 + F_Map.ScaleWidth) \ BrushWidth + 1
  If MHeader.x < F_Map.ScaleWidth \ BrushWidth Then tx = MHeader.x
  ty = (cy1 + F_Map.ScaleHeight) \ BrushHeight + 1
  If MHeader.y < F_Map.ScaleHeight \ BrushHeight Then ty = MHeader.y
  For i = cx1 \ BrushWidth + 1 To tx
   For j = cy1 \ BrushHeight + 1 To ty
        kep.PrintFrame MMap(j, i), kep.GetNextFrame(MMap(j, i)), GetRealX((i - 1) * BrushWidth), GetRealY((j - 1) * BrushHeight)
   Next j
  Next i
  'draw grid if enabled
  If F_Main.M_Grid.Checked = True Then DrawMapGrid
  primary.Blt rd, backbuffer, rs, DDBLT_WAIT
'  RefreshMiniMap
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

Public Sub RefreshSelecteBrush()
  F_SelectBrush.L_KurensBrush.Caption = SelectedBrush
End Sub

Public Sub RefreshSelectColor()
  F_GetColor.ScrollR = VBrush(SelectedBrush).r
  F_GetColor.ScrollG = VBrush(SelectedBrush).G
  F_GetColor.ScrollB = VBrush(SelectedBrush).B
  F_GetColor.L_R.Caption = VBrush(SelectedBrush).r
  F_GetColor.L_G.Caption = VBrush(SelectedBrush).G
  F_GetColor.L_B.Caption = VBrush(SelectedBrush).B
  F_GetColor.l_Color = RGB(VBrush(SelectedBrush).r, VBrush(SelectedBrush).G, VBrush(SelectedBrush).B)
  F_GetColor.P_Color.BackColor = RGB(VBrush(SelectedBrush).r, VBrush(SelectedBrush).G, VBrush(SelectedBrush).B)
  F_GetColor.P_Color.Cls
End Sub
