let bart = {
  print("I will pass this course with best mark, because Swift is great!")
}

func smartBart(n: Int, closure: () -> Void) {
  for _ in 1...n {
    closure()
  }
}
smartBart(n: 11, closure: bart)