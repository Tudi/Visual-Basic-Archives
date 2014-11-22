Attribute VB_Name = "valtozok"
Option Explicit
Public nrelem As Integer
Public Type elemtipus
   e As String
   m As String
   f As String
   mb(32) As Byte
   fb(64) As Byte
   de(32) As Byte
   ce(32) As Byte
   ad(32) As Byte
   inm(65) As Byte
   s As Byte
   exp As Integer
End Type
Public velem(50) As elemtipus
Public muvelet As Byte
Public eredmeny As elemtipus
Public temp As elemtipus, temp1 As elemtipus
Public kurensbazis As Byte
