ListProto := List proto
IoException := Exception clone
ListProto newSlot("myAverage", method("myAverage",
	result := 0; 
	try(result := reduce(+) / size) catch(Exception, IoException raise("Must all be of type Number"));
	return result;))

aList := list(1,2,3,4,5,6)

writeln("My average call")
writeln(aList myAverage)
writeln("\nBuilt in average call")
writeln(aList average)

aList := list(1,2,3,"4",5,6)
writeln("\nWith Exception")
writeln(aList myAverage)