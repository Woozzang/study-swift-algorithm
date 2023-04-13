import Foundation

func solution() {
  var input = Int(readLine()!)!
  
  var start = 666
  
  while true {
    
    var count = 0
    
    for char in "\(start)" {
      
      if char == "6" {
        count += 1
      } else {
        count = 0
      }
      
      if count == 3 {
        input -= 1
        break
      }
    }

    if input == 0 { break }
    
    start += 1
  }
  
  print(start)
}

solution()

