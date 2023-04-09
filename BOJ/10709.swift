import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

var map = [[Int]]()
var results = [[Int]]()

// N줄 반복
for _ in (1...inputs[0]) {
  var line = [Int]()
  
  readLine()!.forEach {
    if $0 == "c" {
      line.append(1)
    } else {
      line.append(0)
    }
  }
  
  map.append(line)
}

for y in (0..<inputs[0]) {
  var line = [Int]()
  
  for x in (0..<inputs[1]) {
    
    var distance = -1
    
    if map[y][x] == 1 {
      line.append(0)
      continue
    }
    
    if x == 0 {
      line.append(distance)
      continue
    }
        
    for left in (0...x-1) {
      if map[y][left] == 1 {
        
        if distance == -1 {
          distance = x - left
        } else {
          distance = min(x-left, distance)
        }
        
        continue
      }
    }
    
    line.append(distance)
  }
  
  results.append(line)
}

results.forEach {
  $0.forEach {
    print($0, terminator: " ")
  }
  print()
}
