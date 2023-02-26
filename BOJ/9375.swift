let testCount = Int(readLine()!)!

for _ in (1...testCount) {
  
  let itemCount = Int(readLine()!)!
  
  guard itemCount > 0 else {
    print(0)
    continue
  }
  
  var dict = [String: Int]()
    
  for _ in (1...itemCount) {
    
    let input = readLine()!.split(separator: " ").compactMap { String($0) }
    
    dict[input[1]] = (dict[input[1]] ?? 0) + 1
  }
  
  if dict.count == 1 {
    print(dict.values.reduce(0, +))
  } else {
    print(dict.values.reduce(1) { partialResult, value in
      partialResult * (value + 1)
    } - 1)
  }
}
