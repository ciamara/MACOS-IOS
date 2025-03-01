var names = ["Hommer","Lisa","Bart"]

var fullNames: [[String: String]] = []

for name in names {
    let person = [
        "firstName": name,
        "lastName": "Simpson"
    ]
    fullNames.append(person)
}

print(fullNames)