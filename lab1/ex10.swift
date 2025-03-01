var number = 10
var divisors = Set<Int>()
var index = 1

while index <= number {

    if number % index == 0 {
        divisors.insert(index)
    }
    index += 1
}

print(divisors.sorted())

