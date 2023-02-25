let input = readLine()!.split(separator: " ").compactMap { Int($0) }

var nameKey = [String: Int]()
var numberKey = [Int: String]()


for number in (1...input[0]) {
  
  let value = readLine()!
  
  nameKey[value] = number
  numberKey[number] = value
}

for _ in (1...input[1]) {
  
  let value = readLine()!
  
  if let number = Int(value), let name = numberKey[number] {
    print(name)
  } else if let number = nameKey[value] {
    print(number)
  }
}

