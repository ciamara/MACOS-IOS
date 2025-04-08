//Tamara Mruk, 197584
//Zrobilam wszystkie podpunkty
// Jako feature w ostatnim zadaniu zaimplementowalam day/night cycle co 5 
// tur, podczas nocy do creature.patience dodawana jest dodatkowa losowa
// liczba, a gdy z powrotem nastaje dzien dodatkowa wartosc jest usuwana

struct Creature {
    var name: String
    var mood: Int //1-3
    var patience: Int //=health
    var basePatience: Int
    
    var isCalm: Bool {
        return patience > 0
    }
    
    mutating func adjustPatience(for timeOfDay: String) {
        if timeOfDay == "Night" {
            let nightBonus = Int.random(in: 7...15)
            patience = basePatience + nightBonus
        } else if timeOfDay == "Day" {
            patience = basePatience
        }
    }
    
    static func randomEncounter(timeOfDay: String) -> Creature {
        let name = [
            "Snufkin", "Moomintroll", "Little My", "Hattifatteners", 
            "Thingumy", "The Groke", "Hemulen", "Fillyjonk", "Stinky", 
            "Tooticky", "Moominmamma", "Moominpappa"
        ].randomElement()!
        let mood = Int.random(in: 1...3)
        let basePatience: Int
        switch mood {
        case 3:
            basePatience = Int.random(in: 18...27)
        case 2:
            basePatience = Int.random(in: 10...17)
        default:
            basePatience = Int.random(in: 1...9)
        }
        var creature = Creature(name: name, mood: mood, patience: basePatience, basePatience: basePatience)
        
        creature.adjustPatience(for: timeOfDay)
        
        return creature
    }
    
    func logEncounter() {
    
        let moodDescription: String
        switch mood {
        case 1: moodDescription = "😊"
        case 2: moodDescription = "😐"
        case 3: moodDescription = "😠"
        default: moodDescription = "🤔"
        }
        
        let bonusText = patience > basePatience ? " + \(patience - basePatience)" : ""
        print("🐾 Creature name: \(name), Mood: \(moodDescription), Patience: \(basePatience)\(bonusText)")
        
    }
}

struct MoominCharacter {
    var name: String
    var health: Int
    var friendship: Int
    var level: Int
    
    var isHealthy: Bool {
        return health > 0
    }
    
    mutating func levelUp() {
        health += 2
        friendship += 2
        level += 1
        
    }
    
    func printStats() {
        print("""
        -------------------------
        🧍 Your Stats:
        Name: \(name)
        Health: \(health)
        Friendship: \(friendship)
        Level: \(level)
        -------------------------
        """)
    }
}

func handleEncounter(moomin: inout MoominCharacter, creature: inout Creature, timeOfDay: String) {
    moomin.printStats()
    print("\n💥 A wild creature appears!\n")
    creature.logEncounter()
    
    print("""
    What do you want to do?
    1 - 🗣 Talk
    2 - 🏃 Run
    """)
    
    if let choice = readLine() {
        switch choice {
        case "1":
            talkToCreature(moomin: &moomin, creature: &creature)
        case "2":
            runAway(moomin: &moomin, creature: &creature)
        default:
            print("❓ Invalid choice. The creature got bored and left.")
        }
    }
}

func talkToCreature(moomin: inout MoominCharacter, creature: inout Creature) {
    print("\(moomin.name) tries to talk to the creature...")
    creature.patience -= moomin.friendship
    
    if creature.patience <= 0 {
        print("🕊 The creature calms down and leaves peacefully.")
        moomin.levelUp()
        print("🎉 You leveled up!")
    } else {
        print("😡 The creature is still moody and attacks!")
        moomin.health -= 3
        print("💔 Your health is now \(moomin.health)")
    }
}

func runAway(moomin: inout MoominCharacter, creature: inout Creature) {
    print("🏃 Attempting to run away...")
    if Bool.random() {
        print("✅ You escaped safely!")
    } else {
        print("❌ You failed to escape! The creature spooks you!")
        moomin.health -= 2
        print("💢 You took 2 damage. Health is now \(moomin.health)")
    }
}

func main() {
    
    var currentTurn = 0
    var timeOfDay = "Day"
    var moomin = MoominCharacter(name: "Snufkin", health: 20, friendship: 5, level: 1)
    
    print("🌿 Welcome, \(moomin.name)!")
    
    while moomin.isHealthy {
        
        let timeEmote = timeOfDay == "Day" ? "🌞" : "🌙"
        print("\nTurn \(currentTurn + 1): \(timeEmote) \(timeOfDay)")
        var creature = Creature.randomEncounter(timeOfDay: timeOfDay)
        handleEncounter(moomin: &moomin, creature: &creature, timeOfDay: timeOfDay)
        
        if !moomin.isHealthy {
            print("\n☠️ Oh no! \(moomin.name) has no health left. Game Over. You survived \(currentTurn) turns")
        }
        
        if (currentTurn + 1) % 5 == 0 {
            timeOfDay = timeOfDay == "Day" ? "Night" : "Day"
        }
        currentTurn += 1
    }
}

main()
