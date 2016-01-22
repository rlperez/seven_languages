Matrix := list clone

Matrix dim := method(x, y,
  result := Matrix clone;
  column := Matrix clone;
  y repeat(column append(nil));
  x repeat(result append(column clone));
  )

Matrix get := method(x, y, 
  return at(x) at(y);
  )

Matrix set := method(x, y, value, 
  return at(x) atPut(y, value);
  )

Matrix transpose := method(
  self map(reverse) reverse
)

m := Matrix clone
m := m dim(2,2)
writeln("Dim")
writeln(m)

writeln("Set")
m set(0,0,1)
m set(1,1,2)
m set(1,0,3)
m set(0,1,4)
writeln(m)

writeln("Transpose")
writeln(m transpose)
