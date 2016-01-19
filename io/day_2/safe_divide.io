"Unsafe Divide" println
(1 / 0) println
(2 / 0) println

NumberPrototype := 1 proto
unsafeDivide := NumberPrototype getSlot("/")
NumberPrototype / := method(denominator, if(denominator == 0, 0, oldDivide(denominator)))

"" println
"Safe Divide" println
(1 / 0) println
(2 / 0) println