ListProto := List proto
ListProto newSlot("myAverage", method("myAverage", reduce(+) / size))

aList := list(1,2,3,4,5,6)

writeln("My average call")
writeln(aList myAverage)
writeln("\nBuilt in average call")
writeln(aList average)