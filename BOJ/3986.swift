import Foundation

let cnt = Int(readLine()!)!

var result = 0

(1...cnt).forEach { _ in
  
  var stack: [Character] = .init()
  
  let input = readLine()!
  
  input.forEach {
    
    if stack.isEmpty {
      stack.append($0)
    } else if let top = stack.last{
      
      if top == $0 {
        stack.removeLast()
      } else {
        stack.append($0)
      }
    }
  }
  
  if stack.isEmpty {
    result += 1
  }
}

print(result)

