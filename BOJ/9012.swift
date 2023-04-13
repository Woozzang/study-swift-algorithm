import Foundation

func check(_ str: String) -> String {
  
  var stack = [Character]()
  
  for char in str {
    
    if char == "(" {
      stack.append(char)
    } else {
      if stack.isEmpty { return "NO" } //ealry return
      if stack.last == "(" { _ = stack.popLast() }
    }
  }
  
  return stack.isEmpty ? "YES" : "NO"
}



func solution() {
  let count = Int(readLine()!)!
  
  for _ in (1...count) {
    let input = readLine()!
    print(check(input))
  }
}

solution()
