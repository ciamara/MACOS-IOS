var string = "Gdansk University of Technology"
var stringHeart = ""
let sparklingHeart = "\u{1F496}"

for character in string {
    if character == "n"{
        stringHeart += sparklingHeart
    }
    else {
        stringHeart += String(character)
    }
}

print(stringHeart)