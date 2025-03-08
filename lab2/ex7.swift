var strings = ["Gdansk", "University", "of", "Technology"]
print(strings.reduce("") { $0 + ($0.isEmpty ? "" : " ") + $1 })