writeln("if(<some value>,writeln(\"aaaa\"), writeln(\"bbbb\"))")

writeln("\nfalse is false")
if(false,writeln("aaaa"), writeln("bbbb"))

writeln("\nNil is false")
if(nil,writeln("aaaa"), writeln("bbbb"))

writeln("\ntrue is true")
if(true,writeln("aaaa"), writeln("bbbb"))

writeln("\nNot Nil is true")
if("",writeln("aaaa"), writeln("bbbb"))

Contact := Object clone 
writeln("\n====== Contact Object Clone")
writeln(Contact)

Contact name ::= nil
Contact address ::= nil
Contact city ::= nil
writeln("\n====== Contact Slot Names")
writeln(Contact slotNames)

holmes := Contact clone setName("Holmes") setAddress("221B Baker St") setCity("London") 
writeln("\n====== Slot Names")
writeln(holmes slotNames)

Contact fullAddress := method(list(name, address, city) join("\n")) 
writeln("\n====== Full Address")
writeln(holmes fullAddress)

writeln("\n====== Full Address Slot" )
writeln(holmes getSlot("fullAddress"))