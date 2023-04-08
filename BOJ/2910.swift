import Foundation

readLine()
let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
var number = 0

var dict: [Int: (Int, Int)] = .init()

inputs.forEach {
  if let value = dict[$0] {
    dict[$0] = (value.0, value.1 + 1)
  } else {
   dict[$0] = (number, 1)
    number += 1
  }
}

dict.sorted(by: {
  
  if $0.value.1 ==  $1.value.1 {
    
    return $0.value.0 < $1.value.0
    
  } else {
    
    return $0.value.1 > $1.value.1
  }
}).forEach {
  for _ in (1...$0.value.1) {
    print($0.key, terminator: " ")
  }
}
