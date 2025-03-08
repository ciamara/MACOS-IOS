let numbers4div = [10, 16, 18, 30, 38, 40, 44, 50]
print(numbers4div.reduce(Int.min){ max($0, $1) })