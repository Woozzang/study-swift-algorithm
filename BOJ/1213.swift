import Foundation

func solution() {
  
  var dict: [String: Int] = .init()

  readLine()!.forEach {
    
    let key = String($0)
    
    dict.updateValue((dict[key] ?? 0) + 1, forKey: key)
  }

  var left = ""
  var center: String?
  var right = ""

  var ordered = dict.sorted(by: <)

  for (key, value) in ordered {
    
    var value = value
    
    while value >= 2 {
      
      left.append(contentsOf: key)
      right.append(contentsOf: key)
      
      value -= 2
    }
    
    if value == 1 {
      
      if center == nil {
        center = key
        value -= 1
      } else {
        print("I'm Sorry Hansoo")
        return
      }
    }
  }

  print(left + (center ?? "") + right.reversed())
}


solution()
