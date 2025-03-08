func divides(_ a:Int, _ b:Int) -> Bool{
  return a % b == 0
}

func countDivisors(_ n:Int) -> Int{
  var countdivisors = 0
    for i in 1...n {
        if divides(n, i) {
            countdivisors += 1
        }
    }
    return countdivisors
}

func isPrime(_ n:Int) -> Bool {
  return countDivisors(n) == 2
}

print(divides(7, 3))
print(divides(8, 4))

print(countDivisors(1))
print(countDivisors(10))
print(countDivisors(12))

print(isPrime(3))
print(isPrime(8))
print(isPrime(13))