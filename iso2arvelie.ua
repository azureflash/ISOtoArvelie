# ISO to Arvelie conversion
# https://wiki.xxiivv.com/site/arvelie.html
# IsLeap ? Year
IsLeapYear ← ◿2/+=0⊞◿4_100_400
⍤"1900 is not a leap year" =0 IsLeapYear 1900
⍤"2000 is a leap year" =1 IsLeapYear 2000
⍤"2024 is a leap year" =1 IsLeapYear 2024
D ← ⨬(MonthDays|LeapMonthDays) IsLeapYear
Epoch ← 2006
# Year Month Day ? ISODate
SplitDate ← °[⊙⊙∘]⊜⋕⊸≠@-
# ArvYear PastMonthsDays ? Year Month
ProcessYear ← ⊃(-Epoch|↙⊓-D1:)
# ArvMonth ArvDay ? PastMonthsDays CurrMonthDays
CalcDays ← ⨬(⊃(+@A⌊÷|-1◿)14|@+ -365)⊸>364+/+
# ArvelieString ? ArvYear ArvMonth ArvDay
ToString ← ⊂⊂⍜⊙:∩(⬚@0↙¯2°⋕)
ISOtoArvelie ← ToString ⊙CalcDays ProcessYear SplitDate
⍤"Incorrect conversion!" ≍"01D06" ISOtoArvelie "2007-02-18"
⍤"Incorrect conversion!" ≍"02A00" ISOtoArvelie "2008-01-01"
⍤"Incorrect conversion!" ≍"14+00" ISOtoArvelie "2020-12-30"
⍤"Incorrect conversion!" ≍"14+01" ISOtoArvelie "2020-12-31"
