var numbers = [5, 10, 20, 15, 80, 13]
var reverseNumbers = ""

for number in numbers {

    reverseNumbers = String(number) + " " + reverseNumbers
}

print(reverseNumbers)