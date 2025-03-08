enum Day: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    func emoji() -> String {
        switch self {
        case .monday:
            return "🐱"
        case .tuesday:
            return "🐷"
        case .wednesday:
            return "🐗" 
        case .thursday:
            return "🐻" 
        case .friday:
            return "🐹"
        case .saturday:
            return "🐲"
        case .sunday:
            return "🦩"
        }
    }
}

var today = Day.monday
print("Today is \(today) \(today.emoji())")

today = Day.tuesday
print("Today is \(today) \(today.emoji())")

today = Day.wednesday
print("Today is \(today) \(today.emoji())")

today = Day.thursday
print("Today is \(today) \(today.emoji())")

today = Day.friday
print("Today is \(today) \(today.emoji())")

today = Day.saturday
print("Today is \(today) \(today.emoji())")

today = Day.sunday
print("Today is \(today) \(today.emoji())")
