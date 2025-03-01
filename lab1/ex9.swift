var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]

var uniqueNumbersSet = Set<Int>()
var uniqueNumbers = ""

for number in allNumbers {

    if !uniqueNumbersSet.contains(number) {
        uniqueNumbersSet.insert(number)
        uniqueNumbers += String(number) + " "
    }
}

print(uniqueNumbers)