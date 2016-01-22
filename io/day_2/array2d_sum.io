sum2dArray := method(arr,
  sum := 0;
  for(i, 0, arr size - 1,
    for(j, 0, arr at(i) size - 1,
      sum := sum + (arr at(i) at(j));
    )
  )
  return sum;
)

arr1 := list(list(1,1),list(1,1))
arr2 := list(list(1,2,3),list(4,5,6))
arr3 := list(list(1,2,3),list(4,5,6),list(7,8,9))
"\n2 x 2 of all 1's = 4" println
writeln(sum2dArray(arr1))

"\n2 x 3 incrementing left to right top to bottom = 21" println
writeln(sum2dArray(arr2))

"\n3 x 3 incrementing left to right top to bottom = 45" println
writeln(sum2dArray(arr3))
