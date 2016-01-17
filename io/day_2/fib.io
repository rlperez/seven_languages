Fib := Object clone
Fib recursive := method(n,
    if(n <= 0, 0,
    if(n == 1, 1,
      (Fib recursive(n - 1)) + (Fib recursive(n - 2)))
    )
  )

writeln("Test Fib Recursive")
writeln("Fib 0")
writeln(Fib recursive(0))
writeln("Fib 1")
writeln(Fib recursive(1))
writeln("Fib 2")
writeln(Fib recursive(2))
writeln("Fib 3")
writeln(Fib recursive(3))
writeln("Fib 4")
writeln(Fib recursive(4))
writeln("Fib 5")
writeln(Fib recursive(5))
writeln("Fib 6")
writeln(Fib recursive(6))