var flights: [[String: String]] = [
[
"flightNumber" : "AA8025",
"destination" : "Copenhagen"
],
[
"flightNumber" : "BA1442",
"destination" : "New York"
],
[
"flightNumber" : "BD6741",
"destination" : "Barcelona"
]
]

var flightNumbers = Array<String>()

for flight in flights {

    if let flightNumber = flight["flightNumber"] {
        flightNumbers.append(flightNumber)
    }
    
}

print(flightNumbers)


