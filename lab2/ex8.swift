let numbers = [1, 2, 3, 4, 5, 6]

let result = numbers
  .filter { $0 % 2 != 0 }       // odd numbers
  .map { $0 * $0 }              // square number
  .reduce(0, +)                 // sum squared

print(result)