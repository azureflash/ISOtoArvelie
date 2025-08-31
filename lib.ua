# Experimental!
# ISO to Arvelie conversion
# https://wiki.xxiivv.com/site/arvelie.html
# IsLeap ? Year
IsLeapYear ← ◿2/+=0⊞◿4_100_400
⍤"1900 is not a leap year" =0 IsLeapYear 1900
⍤"2000 is a leap year" =1 IsLeapYear 2000
⍤"2024 is a leap year" =1 IsLeapYear 2024
D ← ⨬(MonthDays|LeapMonthDays) IsLeapYear
# Year Month Day ? ISODate
SplitDate ← °⊟₃⊜⋕⊸≠@-
# ArvYear PastMonthsDays ? Epoch Year Month
ApplyEpoch ← ⊙↘₋₁⊙˜↙⊃-D
# ArvMonth ArvDay ? PastMonthsDays CurrMonthDays
CalcDays ← ⨬(⊃(+@A⌊÷|-1◿)14|@+ -364)⊸>363+/+
# ArvelieString ? ArvYear ArvMonth ArvDay
ToString ← ⊂₃⍜⊙:∩(⬚@0↙¯2°⋕)
# ArvelieString ? Epoch ISOString
ISOtoArvelie ← ToString ⊙CalcDays ApplyEpoch ⊙SplitDate
⍤"Incorrect!" ≍"01D06" ISOtoArvelie 2006 "2007-02-18"
⍤"Incorrect!" ≍"02A00" ISOtoArvelie 2006 "2008-01-01"
⍤"Incorrect!" ≍"03F10" ISOtoArvelie 2006 "2009-03-22"
⍤"Incorrect!" ≍"14+00" ISOtoArvelie 2006 "2020-12-30"
⍤"Incorrect!" ≍"14+01" ISOtoArvelie 2006 "2020-12-31"
