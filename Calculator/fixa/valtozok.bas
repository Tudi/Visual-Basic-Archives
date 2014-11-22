Attribute VB_Name = "valtozok"
Option Explicit
Public nrelem As Integer
Public Type elemtipus
   kb As Integer
   vb As Integer
   e As String
   ve As String
   de(32) As Byte
'   he As Integer
   ce(32) As Byte
   ie(32) As Byte
   ad(32) As Byte
   ai(32) As Byte
   ac(32) As Byte
   inm(65) As Byte
End Type
Public velem(50) As elemtipus
Public muvelet As Byte
Public eredmeny As elemtipus
Public temp As elemtipus, temp1 As elemtipus
Public kurensbazis As Byte
