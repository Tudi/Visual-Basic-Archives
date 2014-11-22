Attribute VB_Name = "fuggvenyek"
Option Explicit

Sub cib10(ik)
 Dim sz, i, hatv, k As Integer
 Dim sz1 As String
 hatv = 1
 velem(ik).ve = velem(ik).e
 velem(ik).vb = velem(ik).kb
 If (Mid(velem(ik).e, 1, 1) = "-") Then
    sz1 = Mid(velem(ik).e, 2, Len(velem(ik).e))
    k = 2
  Else: k = 1
        sz1 = velem(ik).e
 End If
 For i = Len(sz1) To 1 Step -1
   If (Mid(sz1, i, 1) = "1") Then sz = sz + 1 * hatv
   If (Mid(sz1, i, 1) = "2") Then sz = sz + 2 * hatv
   If (Mid(sz1, i, 1) = "3") Then sz = sz + 3 * hatv
   If (Mid(sz1, i, 1) = "4") Then sz = sz + 4 * hatv
   If (Mid(sz1, i, 1) = "5") Then sz = sz + 5 * hatv
   If (Mid(sz1, i, 1) = "6") Then sz = sz + 6 * hatv
   If (Mid(sz1, i, 1) = "7") Then sz = sz + 7 * hatv
   If (Mid(sz1, i, 1) = "8") Then sz = sz + 8 * hatv
   If (Mid(sz1, i, 1) = "9") Then sz = sz + 9 * hatv
   If (Mid(sz1, i, 1) = "0") Then sz = sz + 0 * hatv
   If (Mid(sz1, i, 1) = "a" Or Mid(sz1, i, 1) = "A") Then sz = sz + 10 * hatv
   If (Mid(sz1, i, 1) = "b" Or Mid(sz1, i, 1) = "B") Then sz = sz + 11 * hatv
   If (Mid(sz1, i, 1) = "c" Or Mid(sz1, i, 1) = "C") Then sz = sz + 12 * hatv
   If (Mid(sz1, i, 1) = "d" Or Mid(sz1, i, 1) = "D") Then sz = sz + 13 * hatv
   If (Mid(sz1, i, 1) = "e" Or Mid(sz1, i, 1) = "E") Then sz = sz + 14 * hatv
   If (Mid(sz1, i, 1) = "f" Or Mid(sz1, i, 1) = "F") Then sz = sz + 15 * hatv
   If (Mid(sz1, i, 1) = "g" Or Mid(sz1, i, 1) = "G") Then sz = sz + 16 * hatv
   If (Mid(sz1, i, 1) = "h" Or Mid(sz1, i, 1) = "H") Then sz = sz + 17 * hatv
   If (Mid(sz1, i, 1) = "i" Or Mid(sz1, i, 1) = "I") Then sz = sz + 18 * hatv
   If (Mid(sz1, i, 1) = "j" Or Mid(sz1, i, 1) = "J") Then sz = sz + 19 * hatv
   If (Mid(sz1, i, 1) = "k" Or Mid(sz1, i, 1) = "K") Then sz = sz + 20 * hatv
   If (Mid(sz1, i, 1) = "l" Or Mid(sz1, i, 1) = "L") Then sz = sz + 21 * hatv
   If (Mid(sz1, i, 1) = "m" Or Mid(sz1, i, 1) = "M") Then sz = sz + 22 * hatv
   hatv = hatv * velem(ik).kb
 Next
 velem(ik).kb = 10
 If (k = 2) Then velem(ik).e = "-" + Str(sz)
 If (k = 1) Then velem(ik).e = Str(sz)
End Sub

Sub cib2(stringe, hova)
 Dim ig As Long
 Dim ind As Byte, i As Byte
 Dim bt As Byte
 If (Mid(stringe, 1, 1) = "-") Then
    ig = Int(Mid(stringe, 2))
   Else: ig = Int(stringe)
 End If
 ind = 32
 For i = 1 To 32
  hova(i) = 0
 Next
 While ig > 0
  bt = ig Mod 2
  hova(ind) = bt
  ind = ind - 1
  ig = Int(ig / 2)
 Wend
 If (Mid(stringe, 1, 1) = "-") Then hova(1) = 1
End Sub

Sub masol(mit, hova)
 Dim i As Integer
 For i = 0 To 32
   hova(i) = mit(i)
 Next
End Sub

Sub levagmasol(mit, hova)
 Dim i As Integer
 For i = 2 To 32
   hova(i) = mit(32 + i)
 Next
 hova(1) = mit(1)
 hova(0) = 0
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

Sub cici(de, ie)
 Dim i As Integer
 For i = 1 To 32
   ie(i) = de(i)
 Next
 If (de(1) = 1) Then
   For i = 2 To 32
     ie(i) = 1 - de(i)
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

Sub initv(v)
 Dim i As Byte
 For i = 0 To 32
  v(i) = 0
 Next
End Sub

Sub Booth()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1 As Currency, sz2 As Long, kitevo As Variant
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Inmultire prin metoda lui Booth"
 inittemp
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = Str(temp.de(1))
   s1 = Str(velem(i).de(1))
   sz1 = 0
   sz2 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.de(34 - j) * kitevo
    sz2 = sz2 + velem(i).de(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   If (velem(i).de(1) = 1) Then sz2 = -sz2
   szoutput.Loutput.AddItem "Se inmultesc numerele " + Str(sz1) + " *" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   inmBooth temp.de, velem(i).de, temp.inm
   s = Str(temp.inm(1))
   sz1 = 0
   kitevo = 1
   For j = 2 To 64
    sz1 = sz1 + temp.inm(66 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.inm(j))
   Next
   levagmasol temp.inm, temp.de
   If (temp.inm(1) = 1) Then sz1 = -sz1
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub inmBooth(de1, de2, inm)
  Dim ce1(32) As Byte, nce1(32) As Byte, ce2(32) As Byte, t(32) As Byte
  Dim i, k As Integer
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se determina compl(a),compl(-a),compl(b)"
  cicc de1, ce1
  masol de1, nce1
  nce1(1) = 1 - nce1(1)
  cicc nce1, nce1
  cicc de2, ce2
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se initializeaza c(i)=0 ,c(i+32)=b(i) ,i=1->32"
'se inicializeaza inmultitul
  For i = 1 To 32
   inm(i) = 0
   inm(i + 32) = ce2(i)
  Next
  inm(65) = 0
  inm(0) = 0
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "De n ori se uita daca ultimele doua cifre sunt '01' atunci aduna compl(a)/'10' aduna compl(-a), si face shl"
  For i = 1 To 32
   If (inm(64) = 0 And inm(65) = 1) Then
    aduna inm, ce1, t
    masol t, inm
   End If
   If (inm(64) = 1 And inm(65) = 0) Then
    aduna inm, nce1, t
    masol t, inm
   End If
   shlbm inm
  Next
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Daca c(1)=1 atunci rezultatul este in cod complementar , se face complementarea"
'daca rezultatul este in cod complementar
 If (inm(1) = 1) Then
   k = 64
   While inm(k) = 0
     k = k - 1
   Wend
   k = k - 1
   For i = k To 2 Step -1
     inm(i) = 1 - inm(i)
   Next
 End If
End Sub

Sub Robertson()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1 As Currency, sz2 As Long, kitevo As Variant
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Inmultire prin metoda lui Robertson"
 inittemp
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = Str(temp.de(1))
   s1 = Str(velem(i).de(1))
   sz1 = 0
   sz2 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.de(34 - j) * kitevo
    sz2 = sz2 + velem(i).de(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   If (velem(i).de(1) = 1) Then sz2 = -sz2
   szoutput.Loutput.AddItem "Se inmultesc numerele " + Str(sz1) + " *" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   inmRobertson temp.de, velem(i).de, temp.inm
   s = Str(temp.inm(1))
   sz1 = 0
   kitevo = 1
   For j = 2 To 64
    sz1 = sz1 + temp.inm(66 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.inm(j))
   Next
   levagmasol temp.inm, temp.de
   If (temp.inm(1) = 1) Then sz1 = -sz1
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub inmRobertson(de1, de2, inm)
  Dim ce1(32) As Byte, nce1(32) As Byte, ce2(32) As Byte, t(32) As Byte
  Dim i, k As Integer
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se determina compl(a),compl(-a),compl(b)"
  cicc de1, ce1
  de1(1) = 1 - de1(1)
  cicc de1, nce1
  de1(1) = 1 - de1(1)
  cicc de2, ce2
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Se initializeaza ci=0 i=1->32,cj=bk j=33->63,k=(j-31)->32"
'se inicializeaza inmultitul
  For i = 1 To 32
   inm(i) = 0
  Next
  For i = 2 To 32
   inm(i + 31) = ce2(i)
  Next
  inm(64) = 0
  inm(0) = 0
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "De n ori se uita daca c(64)=1 atunci aduna compl(a), si face shl"
  For i = 1 To 32
   If (inm(64) = 1) Then
    aduna inm, ce1, t
    masol t, inm
   End If
   shlbm inm
   inm(1) = inm(2)
  Next
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Daca b(0)=1 atunci c=c+compl(-a)"
'daca b0=1 then adauga
  If de2(1) = 1 Then
    aduna inm, nce1, t
    masol t, inm
  End If
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Daca c(1)=1 atunci rezultatul este in cod complementar , se face complementarea"
'daca rezultatul este in cod complementar
  If (inm(1) = 1) Then
   k = 64
   While (inm(k)) = 0
    k = k - 1
   Wend
   k = k - 1
   For i = k To 2 Step -1
    inm(i) = 1 - inm(i)
   Next
  End If
  shlbm inm
  inm(1) = inm(2)
  inm(2) = 0
End Sub

Sub osszeadja()
 Dim i As Integer, j As Integer
 Dim s, s1 As String
 Dim sz1 As Long, sz2 As Long, kitevo As Double
 Dim t(32) As Byte
 szoutput.Loutput.Clear
 szoutput.Loutput.AddItem "Adunarea in cod direct"
' inittemp
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = Str(temp.de(1))
   s1 = Str(velem(i).de(1))
   sz1 = 0
   sz2 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.de(34 - j) * kitevo
    sz2 = sz2 + velem(i).de(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.de(j))
    s1 = s1 + Str(velem(i).de(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   If (velem(i).de(1) = 1) Then sz2 = -sz2
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Se aduna numerele " + Str(sz1) + " +" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod direct a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   osszeaddir temp.de, velem(i).de, temp.ad
   s = Str(temp.ad(1))
   sz1 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.ad(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.ad(j))
'    temp.de(j) = temp.ad(j)
   Next
   masol temp.ad, temp.de
'   temp.de(1) = temp.ad(1)
   If (temp.de(1) = 1) Then sz1 = -sz1
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
 
 szoutput.Loutput.AddItem ""
 szoutput.Loutput.AddItem "*************************************************************************"
 szoutput.Loutput.AddItem ""
 szoutput.Loutput.AddItem "Adunarea in cod complementar"
' inittemp
 temp = velem(1)
 For i = 2 To nrelem - 1
   s = Str(temp.ce(1))
   s1 = Str(velem(i).ce(1))
   sz1 = 0
   sz2 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.de(34 - j) * kitevo
    sz2 = sz2 + velem(i).de(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.ce(j))
    s1 = s1 + Str(velem(i).ce(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   If (velem(i).de(1) = 1) Then sz2 = -sz2
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Se aduna numerele " + Str(sz1) + " +" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod complementar a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   osszeadcomp temp.de, velem(i).de, temp.ad
   masol temp.ad, temp.de
   s = Str(temp.ac(1))
   sz1 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.ad(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.ac(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next

 szoutput.Loutput.AddItem ""
 szoutput.Loutput.AddItem "*************************************************************************"
 szoutput.Loutput.AddItem ""
 szoutput.Loutput.AddItem "Adunarea in cod Invers"
' inittemp
 temp = velem(1)
 For i = 2 To nrelem - 1
   temp1 = velem(i)
   s = Str(temp.ie(1))
   s1 = Str(temp1.ie(1))
   sz1 = 0
   sz2 = 0
   kitevo = 1
   For j = 2 To 32
    sz1 = sz1 + temp.de(34 - j) * kitevo
    sz2 = sz2 + temp1.de(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.ie(j))
    s1 = s1 + Str(temp1.ie(j))
   Next
   If (temp.de(1) = 1) Then sz1 = -sz1
   If (temp1.de(1) = 1) Then sz2 = -sz2
   szoutput.Loutput.AddItem ""
   szoutput.Loutput.AddItem "Se aduna numerele " + Str(sz1) + " +" + Str(sz2)
   szoutput.Loutput.AddItem "reprezentarea in cod invers a numerelor : "
   szoutput.Loutput.AddItem s
   szoutput.Loutput.AddItem s1
   osszeadinv temp.de, velem(i).de, temp.ad
   s = Str(temp.ie(1))
   sz1 = 0
   kitevo = 1
   masol temp.ad, temp.de
   For j = 2 To 32
    sz1 = sz1 + temp.ad(34 - j) * kitevo
    kitevo = kitevo * 2
    s = s + Str(temp.ai(j))
   Next
   If (temp.ad(1) = 1) Then sz1 = -sz1
   szoutput.Loutput.AddItem "primele " + Str(i) + " numere adunate au ca rezultat : " + Str(sz1)
   szoutput.Loutput.AddItem s
 Next
End Sub

Sub osszeadinv(de1, de2, ad)
  Dim i As Integer
  Dim k As Integer
  Dim ie1(32) As Byte, ie2(32) As Byte, unu(32) As Byte, t(32) As Byte
  If szoutput.M_info_true.Checked = True Then
    If (de1(1) <> de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu semn diferit "
    If (de1(1) = de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu acelasi semn "
    szoutput.Loutput.AddItem "Regula de adunare este Si=inv(Ai)+inv(Bi) ,unde Ai,Bi biti din cudul direct"
  End If
  cici de1, ie1
  cici de2, ie2
  aduna ie1, ie2, ad
  'daca sa schimbat semnul (a>0 b>0)
  If (de1(1) = de2(1) And de1(1) <> ad(1)) Then szoutput.Loutput.AddItem "S-a  facut transport la CCMS rezultat incorect nu se poate face corectie(s=s+1)"
  'daca s-a scimbat semnul si a fost overflow
  If ((de1(1) = de2(1) And de1(1) = ad(1) And ad(0) <> 0) Or (de1(1) <> de2(1) And ad(0) <> 0)) Then
    If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "S-a facut transfer la CCMS ,se face corectie,se adauga 1"
     For i = 0 To 32
      unu(i) = 0
     Next
     unu(32) = 1
     aduna ad, unu, t
     masol t, ad
   End If
  masol ad, temp.ai
  If (ad(1) = 1) Then
  If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod invers convertam in codul direct"
    masol ad, temp.ai
    cici ad, t
    masol t, ad
    Else: If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar=codul direct"
  End If
End Sub

Sub osszeadcomp(de1, de2, ad)
  Dim i As Integer
  Dim k As Integer
  Dim ce1(32) As Byte, ce2(32) As Byte, t(32) As Byte
  If szoutput.M_info_true.Checked = True Then
    If (de1(1) <> de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu semn diferit "
    If (de1(1) = de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu acelasi semn "
    szoutput.Loutput.AddItem "Regula de adunare este Si=comp(Ai)+comp(Bi) ,unde Ai,Bi biti din cudul direct"
  End If
  'daca primul numar e negativ =>compl
  cicc de1, ce1
  'daca al doilea numar este negativ =>compl
  cicc de2, ce2
  'sa adunam numerele
  aduna ce1, ce2, ad
  If (de1(1) = de2(1) And de1(1) <> ad(1)) Then szoutput.Loutput.AddItem "S-a  facut transport la CCMS rezultat incorect nu se poate face corectie(s=s+1)"
  'daca rezultatul e negativ inseamna ca este in cod complementar
  masol ad, temp.ac
  If (ad(1) = 1) Then
    If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar convertam in codul direct"
    cicc ad, t
    masol t, ad
    Else: If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar=codul direct"
  End If
End Sub

Sub osszeaddir(de1, de2, ad)
  Dim i As Integer
  Dim k As Integer
  Dim ce1(32) As Byte, ce2(32) As Byte, t(32) As Byte
  If szoutput.M_info_true.Checked = True Then
    If (de1(1) <> de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu semn diferit "
    If (de1(1) = de2(1)) Then szoutput.Loutput.AddItem "Se aduna doua numere cu acelasi semn "
    szoutput.Loutput.AddItem "Regula de adunare este Si=comp(Ai)+comp(Bi) ,unde Ai,Bi biti din cudul direct"
  End If
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
    cicc ad, t
    masol t, ad
    Else: If szoutput.M_info_true.Checked = True Then szoutput.Loutput.AddItem "Rezultatul obtinut este in cod complementar=codul direct"
  End If
End Sub

Sub inittemp()
 Dim i As Integer, j As Integer
 For i = 1 To 32
   temp.de(i) = 0
   temp.ce(i) = 0
   temp.ie(i) = 0
   temp1.de(i) = 0
   temp1.ce(i) = 0
   temp1.ie(i) = 0
   temp.ad(i) = 0
   temp1.ad(i) = 0
   temp.ai(i) = 0
   temp.ac(i) = 0
 Next
End Sub
