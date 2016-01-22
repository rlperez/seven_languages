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
