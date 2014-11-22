Attribute VB_Name = "Valtozok_tipusok"
Option Explicit

'a jatekra szolo altalanos valtozok
Public Path As String ' a jatek ebben a directorban van
Public Const PathSettings = "\settings\gamesettings.dat" 'a jatek altalanos tlajdonsagait tarolja
Public Const PathDefBrushsetting = "\settings\brushsettings.dat" 'default minden brush tulajdonsaga"
Public Const PathMap = "\map\" 'itt talalhatoak a mapek
Public Const PathSave = "\Save\" 'ide rakja a lementett jatekokat
Public Const PathBrushImg = "\settings\brushimg5.jpg" '- a brushokrol itt talalhatunk kepeket
Public Version1 As Integer 'a jatek fo verzioszama
Public Version2 As Integer 'a jatek mellek verzioszama
Public BrushWidth As Byte 'milyen szeles egy brush
Public BrushHeight As Byte 'milyen hosszu egy brush
Public Const MapInitBrush = 2 'a terkepeket ezzel a brush-al inicializalja


'a terkepnek amit lement vagy loadol tulajdonsagai
Public Const MaxMapX = 250 'egy terkep maximum hany brusht tartalmazhat egy sorban
Public Const MaxMapY = 250 '-||-
Public Const MinMapX = 10 'egy terkep minimum hany brusht tartalmazhat egy sorban
Public Const MinMapY = 10 '-||-
Public Const MaxVBrush = 250 'maximum ennyi fajta brush lehet egy terkepen

'egy brush leirasa
Public Const NoData = 0
Public Const NoImige = 1

'mindegyik brush a terkep tulajdonsagait bealitja
'Public Type T_BrushStats
Type T_BrushStats
    Def As Single 'a rajta levo unitok plusz menyi defenset kapnak
    Atack As Single 'a rajta levo unitok plusz menyi atackot kapnak
    Wrange As Single 'a rajta levo unitok plusz menyi lotavolsagot kapnak
    Vrange As Single 'a rajta levo unitok plusz menyi lattavolsagot kapnak
    Speed As Single 'a rajta levo unitok plusz menyi mozgasi buntetest kapnak
    R As Integer ' a szinkod piros osszetevoje
    G As Integer ' a szinkod green osszetevoje
    B As Integer ' a szinkod blue osszetevoje
    NrFrames As Integer 'hany framebol all a brush
    Index As Integer ' a brush vector hanyadik eleme
    Hide As Byte 'eldugja a rajta levo unitot
    CanFly As Byte 'atlehet repulni rajta
    CanMove As Byte 'atlehet menni rajta a foldon
    CanSwim As Byte 'atlehet uszni rajta
    Height As Integer 'a brushnak megfelelo terain milyen magas (hegy,ocean)
    reserved As Integer 'kesobbre
    reserved1 As Integer 'kesobre
    reserved2 As Integer
    reserved3 As Integer
End Type

'a terkep headerjenek a leirasa
Public Type T_MapHeader
      Coment As String * 255 'a terkeprol valami komentar
      WarFog As Integer  'a terkepen lesz fog of var
      x As Integer  'hany brush van egy oszlopban
      y As Integer  'hany brush van egy sorban
      MMap As Integer 'tartalmaz hater terkepet
      MFog As Integer  'tartalmaz fog terkepet
      MHeight As Integer 'tartalmaz magasagi terkepet
      NrUnit As Integer  'hany unit van a terkepen
      NrCity As Integer  'hany varos van a terkepen
      NrMine As Integer  'hany mine van a terkepen
      NrBrush As Integer ' a terkep enyi brusht hasznal
      LX As Integer 'a terkep utolso pozicioja
      LY As Integer 'a terkep utolso pozicioja
      StartPozX(MaxPlayer) As Integer 'a jatekosok kezdesi pozicioja
      StartPozY(MaxPlayer) As Integer 'a jatekosok kezdesi pozicioja
      KurensPlayer As Byte 'most melyik player van soron
      reserved As Integer 'kesobbre
      reserved1 As Integer 'kesobre
      reserved2 As Integer
      reserved3 As Integer
 End Type
 
 'egy varos leirasa
 Public Const MaxCity = 40
 Public Type T_City
    Name As String * 20 'a varos neve
    Ovner As Byte 'melyik jatekose a varos
    PProd As Single 'gyartasi bonus pontok
    PResearch As Single 'fejlesztesi bonusz pontok
    PSzap As Single 'bonusz szaporodasi pontok
    PMoral As Single 'bonusz moral
    PFood As Single 'bonusz kaja
    MResearch As Byte 'maximum hany research building lehet
    KResearch As Byte 'kurens hany research building van
    CCResearch As Single 'hany penzbe kerul egy epulet
    CMResearch As Single 'hany mineralba kerul egy research epulet
    Researchp As Single 'hany research pontot ad egy epulet
    CTReserch As Single 'hany epitesi pontba kerul egy epulet
    KTResearch As Single 'a kurens epitett epuletbol meg menyi van hatra
    MProd As Byte 'max hany gyar lehet
    KProd As Byte 'kurens hany gyar van
    CCProd As Single 'hany creditbe ckerul egy gyar
    CMProd As Single 'hany mineralba kerul egy gyar
    Prodp As Single 'hany epitesi pontot ad egy epulet
    CTProd As Single 'hany epitesi pontba kerul egy epulet
    KTProd As Single 'a kurens epitett epuletbol meg mennyi van hatra
    MFarm As Byte 'maxim hany farmja lehet
    KFarm As Byte  'kurens hany farm van felepitve
    CCFarm As Single 'Hany creditbe kerul egy farm
    CMFarm As Single 'hany mineralba kerul egy farm
    CTFarm As Single 'hany epitesi pontba kerul egy epulet
    Farmp As Single 'hany kajat gyart egy epulet
    MMoral As Byte
    KMoral As Byte
    CCMoral As Single
    CMMoral As Single
    CTMoral As Single
    Moaralp As Single
    MSpace As Byte
    KSpace As Byte
    CCSpace As Single
    CMSpace As Single
    CTSpace As Single
    Spacep As Single
    MEnergy As Byte
    KEnergy As Byte
    CCEnergy As Single
    CMEnergy As Single
    CTEnergy As Single
    Energyp As Single
    Bank As Byte
    Bankp As Single
    TradePost As Byte 'ha megepited megveheted egyenesen a unitokat dupla aron
    CanMove As Byte
    CanFly As Single
    px As Single
    py As Single
    KX As Single
    KY As Single
    NX As Single
    NY As Single
    Visibility As Single
    RShoot As Single
    Rad As Byte
    UnitProd As Single 'a gyartott unitbol meg menyi van hatra
    BuildProd As Single 'a gyartott epuletbol meg mennyi van hatra
    Tax As Single 'mennyi penzt kapok egy embertol
    Ready As Single 'amikor 0 akkor fel van epitve a varos
    Atack As Single 'mennyi dameget tud csinalni
    Def As Single 'mennyi a defensje
    Shield As Single 'mennyi a shieldje
    RShield As Single 'turnunkent ennyit regeneralodik a shieldje
    MShield As Single 'maximalis shieldje
    Upgraded As Byte 'hogyan nez ki a varos
 End Type

'egy banya leirasa
Public Const MaxMine = 200
Public Type T_Mine
    Minerals As Single 'mennyi mineralt tud meg kibanyaszni
    Mineralsp As Single 'ennyi mineralt szed ki turnunkent
    px As Single
    py As Single
    KX As Single
    KY As Single
    NX As Single
    NY As Single
    Visibility As Single
    RShoot As Single
    Rad As Byte
    Ready As Single 'ha 0 akkor fel van epitve a mine
    Atack As Single 'mennyi dameget tud csinalni
    Def As Single 'mennyi a defensje
    Shield As Single 'mennyi a shieldje
    RShield As Single 'turnunkent ennyit regeneralodik a shieldje
    MShield As Single 'maximalis shieldje
    Upgraded As Byte 'a kepkirakaskor hogyan fog kinezni
End Type

'egy jatekos leirasa
Public Const MaxPlayer = 8
Public Type T_Player
  Name As String * 30 'a jatekos neve
  Index As Integer 'hanyadik jatekos
  Type As Byte 'milyen fajjal jatszik
  Color As Long 'milyen szinu a jatekos
  PResearch As Single 'mennyi bonus reserch pontot kap
  PProduction As Single 'mennyi bonus epitesi pontot kap
  PSzap As Single 'mennyi populacio szaporodasi pontot kap
  PSight As Single 'menyi latasi tavolsag bonuszt kap
  PAtack As Single 'Menyi bonus dameget csinal
  PDef As Single 'menyi bonusz defenst kap
  PShield As Single 'mennyi bonus defenst kap
  PSpeed As Single 'bonus lepesi egyseg
  PWRange As Single 'bonus lotav
  PRegen As Single 'bonus eletregeneralodas
  PShRegen As Single 'bonus shield regeneralodas
  PEconomy As Single 'Bonus penz turnunkent
  PBuy As Single 'bonus unit ar
  PExtract As Single 'bonus mineral turnunkent
  Zoom As Single 'a terkep zoomolsa
  Human As Byte 'human vagy computer jatekos
  Playing As Byte 'jatszik kurens
  LastX As Integer 'az utolso terkep pozicio
  LastY As Integer 'az utolso terkep pozicio
  CMCity As Single 'menyi mineralba kerul egy varos megepitese
  CCCity As Single 'menyibe creditbe kerul
  CTCity As Single 'menyi turnbe kerul
  CMMine As Single 'mennyi mineralba kerul egy mine megepitese
  CCMine As Single 'mennyi credit
  CTMine As Single 'mennyi turn
  Minerals As Single 'ennyi mineralja van a jatekosnak
  Credit As Single 'ennyi creditje van a jatekosnak
End Type

'egy unit leirasa
Public Const MaxWeapons4Units = 4
Public Const MaxUnit = 100
Public Type T_Unit
  Name As String * 10 'hogyan hivjak a unitot
  Index As Integer 'hanyas indexu(esetleg a brush feltoltesnel kell)
  Ovner As Integer 'melyik jatekos tulajdona
  KHealth As Single ' a unit kurens elete
  Rhealth As Single 'hany egyseget toltodik az elete egy turn alatt
  MHealth As Single 'a unit maximalis elete
  KStun As Single 'a kurens lefagyasztott unit idoegysege
  CStun As Single 'turnunkent menyit fogy a lefagyasztas ideje
  Stun As Single 'amikor o fagyaszt le mast,menyire
  Def As Single ' a unit armorja
  KShield As Single ' a unit kurens shieldje
  MShield As Single 'maximum menyi shieldje lehet egy unitnak
  RShield As Single 'hany unitot toltodik a shield egy turn alatt
  Exp As Single 'a unit experience-je
  Kills As Integer 'hany unitot nyirt ki
  Type As Integer ' milyen tipusu unit (ugylehet nem hasznalt)
  WSpace As Single 'mekkora a fegyvertarolo kapacitasa
  TSpace As Single 'mekkora a teherszalito kapacitasa
  Space As Single 'mekkora helyet foglal el a unit
  Weapons(MaxWeapons4Units) As Integer 'a felszerelt fegyverek tipusa
  RWeapons(MaxWeapons4Units) As Integer 'milyen gyorsan toltodnek a fegyverek turnunkent
  KWeapons(MaxWeapons4Units) As Integer 'Kurens mennyire vanak a fegyverek feltoltodve
  TCWeapons(MaxWeapons4Units) As Single 'hany lepesi unitba kerul elsutni a fegyveret
  Wrange(MaxWeapons4Units) As Single 'milyen messze tud loni a felszerelt fegyverrel
  IWeapons(MaxWeapons4Units) As Single 'menyire imun egyes fegyverekre
  IIWeapons(MaxWeapons4Units) As Integer 'a fegyverek indexe amelyre imun
  Ammo(MaxWeapons4Units) As Single 'a fegyverek loszerkeszlete
  RAmmo(MaxWeapons4Units) As Single 'turnunkent mennyi amot kap a fegyvereibe
  MAmmo(MaxWeapons4Units) As Single 'maximum menyi golyo lehet a fegyvereiben
  RetFire As Byte 'eszreveszi es lo,visszalo a mozgo ellenseges unitokra
  CanOcupy As Byte 'eltud foglalni ellenseges epuleteket
  CanWork As Byte 'Lehet munkaskent hasznalni
  Food As Single 'mennyi kajat fogyaszt
  Energy As Single 'mennyi energiat fogyaszt
  Cloak As Byte 'eltud bujni a unit
  Rad1 As Byte 'latja az elbujt unitokat
  Rad2 As Byte '?
  SRange As Single 'milyen messze lat el a unit
  MCost As Single 'mennyi mineralba kerul a meggyartasa
  CCost As Single 'mennyi penzbe kerul a meggyartasa
  TCost As Single 'mennyi idoegysegbe kerul a meggyartasa
  px As Single 'hany pixelt lepik egyszerre x szerint
  py As Single 'hany pixelt lepik egyszere y szerint
  KX As Single 'a Brush -on belul hol helyezkedik el x szerint
  KY As Single 'a Brush -on belul hol helyezkedik el y szerint
  Szog As Single 'majd 3D -be lessz hasznalva
  NX As Integer 'a map hanyadik brushjaban van oszlop szerint
  NY As Integer 'a map hanyadik brushjaban van sor szerint
  Grup As Integer 'Hanyas csoprtba tartozik
  Vezer As Byte 'az o kepe jelenik meg a csoport helyett
  Maltag As Integer 'maximum hany altagot tud elvezerelni
  PWExp As Single 'a gyorsasag amivel tanulja az exp a fegyverektol
  PSHExp As Single 'a gyorsasag amivel tanulja az exp a shieldektol
  CanMove As Byte 'tud mozogni
  Speed As Single 'hany pixelt tud lepni egy turn alatt
  KSpeed As Single 'a hatralevo lepesi pontjai
  MSpeed As Single 'Maximum menyire toltodhet fel a lepesi pontja
  TCSpeed As Single 'Menyit csokken a lepesi unitja egy mozditas soran
  TCTurn As Single ''Menyit csokken a lepesi unitja egy fordulas soran
  CanBuildCity As Byte 'tud varost epiteni
  CanBuildMine As Byte 'Tud banyat epiteni
  CrossWater As Byte 'at tud menni a wizen
  CanFly As Byte 'tud repulni
  MHeight As Single 'a maximum magasag amire fel tud maszni
  CanTeleport As Byte 'tud teleportalni a unit
  
  FegyverZavaro As Single 'menyire tudja kivedeni az ellenseg atackjat
  FegyverIranyito As Single 'menyire noveli a damiget
  RadarUpg As Single 'upgrade soran menyivel no meg a latasi tavolsaga
  SpeedUpg As Single ' upgrade soran menyivel no meg a speedje
  ExpUpg As Single 'menyire bonus exp fog kapni a upgrade utan tamadasonkent
End Type

 'mini  ablak konstansai es valtozoi
Public Const MiniMap_Width = MaxMapX * 15 / 1.2
Public Const MiniMap_Height = MaxMapY * 15 / 1.2
Public Const MiniMapbeKocka = 65000
Public Const BarWidth = 200

'a terkep adatait tarolja
Public MHeader As T_MapHeader ' a terkep headerje
Public MMap(MaxMapY, MaxMapX) As Integer 'a hatterterkep
Public MFog(MaxMapY, MaxMapX) As Integer 'a fog terkep
Public MHeight(MaxMapY, MaxMapY) As Integer 'a magassag terkep
Public VBrush(MaxVBrush) As T_BrushStats 'ebbe tarolodnak a brushok tulajdonsagai
Public Name As String 'a map nevegyorsasag amivel tanulja az exp a shieldektol
Public VUnit(MaxPlayer * MaxUnit) As T_Unit 'a jatekosok unitjai
Public VCity(MaxPlayer * MaxCity) As T_City 'a jatekosok varosai
Public VMine(MaxPlayer * MaxMine) As T_Mine 'a banyak listaja
Public VPlayer(MaxPlayer) As T_Player 'a jatekosok listaja
Public SelectedBrush As Integer 'kurens melyik brush-al rajzolsz
Public kep As New AnimatedPicture

'********************************************************
'gaborkatol
Public Const MaxBrush = 100

'load them from the ini file
Public VisibleBrushWidth  As Integer
Public VisibleBrushHeight As Integer


Public Const Inc_SizeX = 15
Public Const Inc_SizeY = 15

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

Public Function getkockaX(mouseX As Integer) As Integer
getkockaX = GetVirtX(mouseX) \ BrushWidth + 1
End Function

Public Function getkockaY(mouseY As Integer) As Integer
getkockaY = GetVirtY(mouseY) \ BrushHeight + 1
End Function

