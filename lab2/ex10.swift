var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]

var countDict = [String: Int]()

for string in stringsArray {
  countDict[string, default: 0] += 1
}

let countedStrings = countDict.map { ($0.key, $0.value) }

print(countedStrings)