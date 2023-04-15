import Foundation

while let str = readLine(), str != "." {
  
  var stack = [Character]()
  
  var check = true
  
  for char in str {
    
    if char == "(" || char == "[" { stack.append(char) }
    
    if char == ")" {
      
      if stack.isEmpty || stack.last != "(" {
        check = false
        break
      }
      
      stack.removeLast()
      
    }
    
    if char == "]" {
      
      if stack.isEmpty || stack.last != "[" {
        check = false
        break
      }
      
      stack.removeLast()
    }
  }
  
  if check && stack.isEmpty { print("yes") }
  else { print("no")}
}
