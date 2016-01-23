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
  temp := self map(reverse) reverse;
  result := Matrix clone;
  result := result dim(temp size, temp at(0) size)
  temp foreach(i, v,
    v foreach(k, vv, 
      result set(i, k, vv);
      )
    )
  return result; 
  )

Matrix asString := method(
  result := "["
  self foreach(v,
    result := result .. "[ "
    v foreach(vv,
      result := result .. vv .. " "
      )
    result := result .. "]"
    )
  result := result .. "]"
  )

Matrix write := method(path,
  f := File with(path);
  f remove;
  f openForUpdating;
  f write(asString());
  f close;
  );

Matrix read := method(path,
  f := File clone openForReading("test.txt");
  result := ""
  lines := f readLines;
  lines foreach(i, line, 
    writeln(line);
    );
  );

m := Matrix clone;
m := m dim(2,2);
writeln("Dim");
writeln(m);

writeln("\nSet");
m set(0,0,1);
m set(1,1,2);
m set(1,0,3);
m set(0,1,4);
writeln(m);

writeln("\nTranspose");
writeln(m transpose);

writeln("\nWrite test.txt");
m write("test.txt");

writeln("\nRead test.txt");
result := Matrix read("text.txt");
writeln(result);