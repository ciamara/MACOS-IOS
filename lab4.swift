import Foundation

class WordGuessingGame {
    let categories: [String: [String]] = [
        "Cities": ["Paris", "London", "Tokyo", "Berlin"],
        "Movies": ["Inception", "Titanic", "Gladiator", "Avatar", "The Great Gatsby"],
        "Books": ["Dune", "It", "Dracula", "Hamlet"],
        "Fruit": ["Banana", "Mango", "Strawberry", "Raspberry"],
        "Games": ["Ultrakill", "Doom", "Dark Souls", "Red Dead Redemption 2"],
        "Programming Languages": ["Swift", "Python", "JavaScript", "C Sharp", "Java", "Assembly"]
    ]
    
    let levels: [String: Int] = ["Easy": 10, "Medium": 7, "Hard": 5]
    
    var selectedWord: String = ""
    var guessedLetters: Set<Character> = []
    var attemptsLeft: Int = 0
    
    func startGame() {
        print("Select category: Cities, Movies, Books, Fruit, Games, Programming Languagaes")
        guard let category = readLine(), let words = categories[category] else {
            print("Invalid category.")
            return
        }
        
        print("Select level: Easy, Medium, Hard")
        guard let level = readLine(), let tries = levels[level] else {
            print("Invalid level.")
            return
        }
        
        selectedWord = words.randomElement()!.uppercased()
        attemptsLeft = tries
        playGame()
    }
    
    func displayBoard() {
        var displayWord = ""
        for letter in selectedWord {
            if letter == " " {
                displayWord.append("  ")
            } else if guessedLetters.contains(letter) {
                displayWord.append(letter)
            } else {
                displayWord.append("_")
            }
            displayWord.append(" ")
        }
        print("\nWord: \(displayWord.trimmingCharacters(in: .whitespaces))")
        print("Attempts left: \(attemptsLeft)")
    }
    
    func playGame() {
        while attemptsLeft > 0 {
            displayBoard()
            print("Enter a letter:")
            
            guard let input = readLine(), let letter = input.uppercased().first else {
                print("Invalid input.")
                continue
            }
            
            if guessedLetters.contains(letter) {
                print("You already guessed this letter.")
                continue
            }
            
            guessedLetters.insert(letter)
            
            if selectedWord.contains(letter) {
                print("Good guess!")
            } else {
                attemptsLeft -= 1
                print("Wrong guess!")
            }
            
            if selectedWord.allSatisfy({ $0 == " " || guessedLetters.contains($0) }) {
                print("Congratulations! You guessed the word: \(selectedWord)")
                return
            }
        }
        print("You lost! The word was: \(selectedWord)")
    }
}

let game = WordGuessingGame()
game.startGame()
