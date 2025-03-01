var numbers = [5, 10, 20, 15, 80, 13]
var currentMax = 0

for element in numbers {
    if element > currentMax {
        currentMax = element
    }
}

print(currentMax)