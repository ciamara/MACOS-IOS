let kitty = " 🐱 "
var index1 = 0
var index2 = 0

while index1 < 10 {

    while index2 < 10 {

        print(kitty, terminator: "")
        index2 += 1
    }
    index2 = 0
    print("")
    index1 += 1
}