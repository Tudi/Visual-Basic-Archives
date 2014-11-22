Attribute VB_Name = "fuggvenyek"
Option Explicit

Sub c2float(ik)
 Dim ig As Single
 Dim ind As Byte, i As Integer, k, k1 As Byte
 Dim bt As Byte
 Dim vsz As Byte
 Dim f As String, m As String, sz As String
 'megnezi negativ-e a szam ha igen akkor vagja le a minuszt elole
 If (Mid(velem(ik).e, 1, 1) = "-") Then
    sz = Mid(velem(ik).e, 2)
    velem(ik).s = 1
   Else: velem(ik).s = 0
         sz = velem(ik).e
 End If
 'kulonvalassza az egesz reszt a tort-tol
 vsz = 1
 While (vsz <= Len(sz) And Mid(sz, vsz, 1) <> ".")
  vsz = vsz + 1
 Wend
 m = Mid(sz, 1, vsz - 1)
 f = Mid(sz, vsz + 1)
 If (f = "") Then f = "0"
 velem(ik).m = m
 velem(ik).f = f
 'inicializalja a tarolo buffert
 For i = 1 To 32
  velem(ik).mb(i) = 0
  velem(ik).fb(i) = 0
  velem(ik).de(i) = 0
 Next
 'az egesz reszet 2-es sazmrendszerbe alakitja
 ind = 32
 ig = Int(m)
 While ig > 0
  bt = ig Mod 2
  velem(ik).mb(ind) = bt
  ind = ind - 1
  ig = Int(ig / 2)
 Wend
 'a tort reszet 2-es szamrendszerbe alakitja
 f = "0." + f
 ig = f
 For i = 1 To 64
  ig = ig * 2
  velem(ik).fb(i) = Int(ig)
  If (ig >= 1) Then ig = ig - 1
 Next
'megszamolja hany szamjegye van a mantisanak
k = 1
While (k < 32 And velem(ik).mb(k) = 0)
  k = k + 1
Wend
velem(ik).exp = 32 - k
'ha veletlenul a szam kisebb mint 0
If (k = 32 And velem(ik).mb(32) = 0) Then
 k1 = 0
 While (velem(ik).fb(k1) = 0 And k1 < 64)
   k1 = k1 + 1
 Wend
 velem(ik).exp = -k1
 k1 = k1 + 1
End If
'osszerakja ahogyan a float-ot abrazolja (s , e, f)
'semn
velem(ik).de(1) = velem(ik).s
'exponent
ig = 127 + velem(ik).exp
For i = 9 To 2 Step -1
  velem(ik).de(i) = ig Mod 2
  ig = Int(ig / 2)
Next i
ind = 10
'ha a szam nagobb mint 0 akkor jobra kell tolni
If (k < 32 Or (k = 32 And velem(ik).mb(32) <> 0)) Then
  k = k + 1
  For i = k To 32
   velem(ik).de(ind) = velem(ik).mb(i)
   ind = ind + 1
  Next
  For i = ind To 32
   velem(ik).de(i) = velem(ik).fb(i - ind + 1)
  Next
 ind = 32
End If
'ha a szam kisebb mint 0 akkor balra kell tolni
If (k = 32 And ind = 10) Then
  For i = ind To 32
    If (k1 + i - ind < 65) Then velem(ik).de(i) = velem(ik).fb(k1 + i - ind)
  Next
End If
End Sub

Sub masol(mit, hova)
 Dim i As Integer
 For i = 0 To 64
   hova(i) = mit(i)
   On Error Resume Next
 Next
End Sub

Sub cicc(de, ce)
 Dim k, i As Integer
 For i = 1 To 32
  ce(i) = de(i)
 Next
 If (de(1) = 1) Then
   k = 32
   While de(k) = 0
     k = k - 1
   Wend
   k = k - 1
   For i = k To 2 Step -1
     ce(i) = 1 - de(i)
   Next
 End If
End Sub

Sub aduna(a, b, ab)
 Dim i As Integer
 For i = 0 To 32
  ab(i) = 0
 Next
 For i = 32 To 0 Step -1
  ab(i) = a(i) + b(i) + ab(i)
  If (ab(i) >= 2) Then
    ab(i) = ab(i) - 2
    If (i > 0) Then ab(i - 1) = ab(i - 1) + 1
  End If
 Next
End Sub

Sub shlbm(mit)
 Dim i As Integer
 For i = 65 To 2 Step -1
   mit(i) = mit(i - 1)
 Next
End Sub

Sub shrbm(mit)
 Dim i As Integer
 For i = 0 To 128
   mit(i) = mit(i + 1)
 Next
 On Local Error Resume Next
End Sub

Public Function cib10(flot As elemtipus) As Double
 Dim i, k As Integer
 Dim eg, tiz, pow As Double
 eg = 0
 pow = 1
 If (flot.exp >= 0 And flot.exp < 65) Then
   For i = (10 + flot.exp - 1) To 10 Step -1
     eg = flot.de(i) * pow + eg
     pow = pow * 2
   Next
   eg = eg + pow
   pow = 2
   tiz = 0
   For i = 10 + flot.exp To 32
     tiz = flot.de(i) * (1 / pow) + tiz
     pow = pow * 2
   Next
 End If
 If (flot.exp < 0) Then
   eg = 0
   pow = 2
   tiz = 0
   For i = 1 To Abs(flot.exp) - 1
     pow = pow * 2
   Next
   tiz = 0
   If (flot.exp <> -64) Then tiz = 1 / pow
   pow = pow * 2
   For i = 10 To 32
     tiz = flot.de(i) * (1 / pow) + tiz
     pow = pow * 2
   Next
 End If
 If (flot.s = 1) Then
   cib10 = -(tiz + eg)
  Else: cib10 = tiz + eg
 End If
End Function

Sub inmBooth(fe1 As elemtipus, fe2 As elemtipus, finm As elemtipus)
  Dim de1(32) As Byte, de2(32) As Byte, ce1(32) As Byte, nce1(32) As Byte, ce2(32) As Byte, t(32) As Byte
  Dim inm(65) As Byte
  Dim j, i, k As Integer
  Dim k1, k2, exp As Integer
  'pentru siguranta variabilele sunt umplute cu 0
  For i = 0 To 32
    de1(i) = 0
    de2(i) = 0
  Next
  For i = 0 To 64
   inm(i) = 0
  Next
  ' se initializeaza semnul lui a si b ul
  de1(1) = fe1.de(1)
  de2(1) = fe2.de(1)
  'numarul este reprezentat ca 1,f daca nu este egal cu 0
  If (fe1.exp <> -64) Then de1(2) = 1
  If (fe2.exp <> -64) Then de2(2) = 1
  'se copieaza cele 2 numere
  For i = 0 To 22
    de1(i + 3) = fe1.de(10 + i)
    de2(i + 3) = fe2.de(10 + i)
  Next
  'daca numerele sunt negative atunci calculam complementara lor
  cicc de1, ce1
  cicc de2, ce2
  'calculeaza negativul variabilei
  masol ce1, nce1
  nce1(1) = 1 - nce1(1)
  cicc nce1, nce1
  'copiem numarul 2 in buffer
  For i = 1 To 32
    inm(i + 32) = ce2(i)
  Next
  inm(65) = 0
  inm(0) = 0
  'incepe inmultirea
  For i = 1 To 32
    If (inm(64) = 0 And inm(65) = 1) Then
      aduna ce1, inm, t
      masol t, inm
    End If
    If (inm(64) = 1 And inm(65) = 0) Then
     aduna nce1, inm, t
     masol t, inm
    End If
    shlbm inm
  Next
  'daca rezultatul este negativ trebuie convertit in cod direct
  cicc inm, inm
 'determina semnul
  finm.de(1) = inm(1)
  finm.s = inm(1)
 'daca sa ocupat inca o pozitie atunci exponentul trebuie incrementat
  exp = fe1.exp + fe2.exp
  i = 2
  If (inm(2) = 1) Then
    exp = exp + 1
    i = 1
  End If
  'copieaza 23 de elemente din rezultat
  For j = 1 To 23
   finm.de(j + 9) = inm(j + i + 2)
  Next
  'daca am inmultit cu 0
  If (fe1.exp = -64 Or fe2.exp = -64) Then exp = -64
  'converteste exponentul in baza 2
  finm.exp = exp
  exp = exp + 127
  For i = 9 To 2 Step -1
    finm.de(i) = exp Mod 2
    exp = Int(exp / 2)
  Next
End Sub

Sub osszaBooth(fe1 As elemtipus, fe2 As elemtipus, fimp As elemtipus)
  Dim de1(32) As Byte, de2(32) As Byte, nce(32) As Byte, t(32) As Byte, t1(32) As Byte
  Dim imp1(129) As Byte
  Dim j, i, k, f As Integer
  Dim k1, k2, exp As Integer
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se uita daca impartiturul este egal cu 0"
  'se uita daca impartitorul e 0
  j = 0
  For i = 10 To 32
   If fe2.de(i) <> 0 Then j = j + 1
  Next
  If (fe2.exp <> -64) Then j = j + 1
  If (j = 0) Then
    szoutput.Loutput.AddItem "Impartire cu 0 nu se poate!!! Rezultatul va fi incorect"
    Exit Sub
  End If
  'se inicializeaza buffer-ul
  For i = 0 To 32
   de1(i) = 0
   de2(i) = 0
   imp1(i) = 0
   t(i) = 0
  Next
  'numarul este reprezentat ca 1,F
  de1(2) = 1
  de2(2) = 1
  'inicializeaza variabilele (copieaza valoarea in buffer)
  For i = 1 To 23
   de1(i + 2) = fe1.de(i + 9)
   de2(i + 2) = fe2.de(i + 9)
  Next
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se calculeaza invesul impartitorului (-b)"
  'calculeaza variabila negativa nce=-de2
   masol de2, nce
   nce(1) = 1
   cicc nce, nce
  'inicializalja a buffert
  For i = 0 To 32
   imp1(i) = de1(i)
  Next
  'impartim numerele
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Impartirea se face prin scaderea impartitorului din numar"
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "pana cand acesta va fi negativ.Se reia algoritmul pentru precizia dorita"
  f = 0
  For i = 0 To 23
    If (f = 0) Then
      aduna imp1, nce, t1
      masol t1, imp1
     Else
      aduna imp1, de2, t1
      masol t1, imp1
    End If
    If (imp1(1) = 0) Then
     f = 0
     t(i) = 1
     Else
      f = 1
      t(i) = 0
    End If
   shrbm imp1
  Next
  'calculeaza noul exponent
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Exponentul este egal cu A.exp-B.exp"
  exp = fe1.exp - fe2.exp
  'daca trebuie se face cotrectie prin scaderea exponentului cu 1 si mutarea virgulei cu o pozitie
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se uita daca trebuie facut corectie la exponent prin scaderea cu 1"
  If (t(0) = 0) Then
    f = 2
    exp = exp - 1
   Else: f = 1
  End If
  t(26) = 0
 'determinare semnului
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se determina semnul"
  If (fe1.de(1) <> fe2.de(1)) Then
    fimp.de(1) = 1
    fimp.s = 1
   Else
    fimp.de(1) = 0
    fimp.s = 0
  End If
 'converteste exponentul in baza 2
 fimp.exp = exp
 exp = exp + 127
 For i = 9 To 2 Step -1
   fimp.de(i) = exp Mod 2
   exp = Int(exp / 2)
 Next
 'copieaza mantisa
 For i = 0 To 22
   fimp.de(10 + i) = t(i + f)
 Next
 fimp.de(32) = 0
End Sub

Sub osszeadja()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1, sz2 As Double
 Dim t(32) As Byte
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Adunarea"
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = ""
   s1 = ""
   sz1 = cib10(temp)
   sz2 = cib10(velem(i))
   For j = 1 To 32
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
    If (j = 1 Or j = 9) Then
     s = s + "|"
     s1 = s1 + "|"
    End If
   Next
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Se aduna numerele " + Str(sz1) + " +" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   osszeadcomp temp, velem(i), temp
   s = ""
   sz1 = 0
   For j = 1 To 32
    s = s + Str(temp.de(j))
    If (j = 1 Or j = 9) Then s = s + "|"
   Next
   sz1 = cib10(temp)
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub szorozza()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1, sz2 As Double
 Dim t(32) As Byte
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Inmultirea"
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = ""
   s1 = ""
   sz1 = cib10(temp)
   sz2 = cib10(velem(i))
   For j = 1 To 32
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
    If (j = 1 Or j = 9) Then
     s = s + "|"
     s1 = s1 + "|"
    End If
   Next
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Se inmultesc numerele " + Str(sz1) + " *" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   inmBooth temp, velem(i), temp
   s = ""
   sz1 = 0
   For j = 1 To 32
    s = s + Str(temp.de(j))
    If (j = 1 Or j = 9) Then s = s + "|"
   Next
   sz1 = cib10(temp)
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere inmultite au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub ossza()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1, sz2 As Double
 Dim t(32) As Byte
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Impartirea"
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = ""
   s1 = ""
   sz1 = cib10(temp)
   sz2 = cib10(velem(i))
   For j = 1 To 32
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
    If (j = 1 Or j = 9) Then
     s = s + "|"
     s1 = s1 + "|"
    End If
   Next
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Impartire intre numerele " + Str(sz1) + " /" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   osszaBooth temp, velem(i), temp
   s = ""
   sz1 = 0
   For j = 1 To 32
    s = s + Str(temp.de(j))
    If (j = 1 Or j = 9) Then s = s + "|"
   Next
   sz1 = cib10(temp)
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere impartite au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub osszeadcomp(fe1 As elemtipus, fe2 As elemtipus, fad As elemtipus)
  Dim i, j As Integer
  Dim k1, k2 As Integer
  Dim ce1(32) As Byte, ce2(32) As Byte, t(32) As Byte, de1(32) As Byte, de2(32) As Byte, ad(32) As Byte
  Dim exp As Integer
  If szoutput.M_info_true.Checked = True Then
    If (fe1.de(1) <> fe2.de(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu semn diferit "
    If (fe1.de(1) = fe2.de(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu acelasi semn "
    szoutput.Loutput.AddItem "Regula de adunare este Si=comp(Ai)+comp(Bi) ,unde Ai,Bi biti din cudul direct"
  End If
  'initializarea
  For i = 1 To 32
   de1(i) = 0
   de2(i) = 0
  Next
  'calculam ca virgula reala sa fie unul sub altul
  k1 = 0
  k2 = 0
  If (fe1.exp > fe2.exp) Then k1 = fe1.exp - fe2.exp
  If (fe1.exp < fe2.exp) Then k2 = fe2.exp - fe1.exp
  For i = 10 To 32
   If ((i - 6 + k2) < 33) Then de1((i - 6) + k2) = fe1.de(i)
   If ((i - 6 + k1) < 33) Then de2((i - 6) + k1) = fe2.de(i)
  Next
  'numarul este reprezentat ca 1,f deci adaugam 1
  If (3 + k2 < 64) Then de1(3 + k2) = 1
  If (3 + k1 < 64) Then de2(3 + k1) = 1
  'copiem si semnul
  de1(1) = fe1.de(1)
  de2(1) = fe2.de(1)
  'daca primul numar e negativ =>compl
  cicc de1, ce1
  'daca al doilea numar este negativ =>compl
  cicc de2, ce2
  'sa adunam numerele
  aduna ce1, ce2, ad
  If (de1(1) = de2(1) And de1(1) <> ad(1)) Then szoutput.Loutput.AddItem "S-a  facut transport la CCMS rezultat incorect nu se poate face corectie(s=s+1)"
  'daca rezultatul e negativ inseamna ca este in cod complementar
  If (ad(1) = 1) Then
    If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar convertam in codul direct"
    cicc ad, ad
    Else: If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar=codul direct"
  End If
 'se uita daca s-a mai ocupat o pozitie
If (ad(4) = 1) Then
 j = 4
 exp = -1
End If
If (ad(3) = 1) Then
 j = 3
 exp = 0
End If
If (ad(2) = 1) Then
 j = 2
 exp = 1
End If
 'copieaza 23 de elemente din rezultat
  For i = 1 To 23
    fad.de(9 + i) = ad(i + j)
  Next
 'determina semnul
 fad.de(1) = ad(1)
 fad.s = ad(1)
 'exponentul este egal cu exponentul mai mare
 If (fe1.exp > fe2.exp) Then
   exp = fe1.exp + exp
  Else: exp = fe2.exp + exp
 End If
 'converteste exponentul in baza 2
 fad.exp = exp
 exp = exp + 127
 For i = 9 To 2 Step -1
   fad.de(i) = exp Mod 2
   exp = Int(exp / 2)
 Next
End Sub
