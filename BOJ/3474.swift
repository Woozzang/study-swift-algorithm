import Foundation

let input = Int(readLine()!)!

var dict = [Int: Int]()

for _ in (1...input) {
  
  let value = Int(readLine()!)!
  
  var division = 5
  
  var total = 0
  
  while division <= value {
    
    total += value / division
    
    division *= 5
  }
  
  print(total)
}
