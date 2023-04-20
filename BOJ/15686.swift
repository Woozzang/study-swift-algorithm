import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
let M = inputs[1]

// (y좌표, x좌표)
var homes = [(Int, Int)]()
var chicks = [(Int, Int)]()

var realTotal = Int.max

for i in (0..<N) {
  readLine()!.split(separator: " ").compactMap { Int($0) }
    .enumerated()
    .forEach {
      if $0.1 == 1 {
        homes.append((i, $0.0))
      } else if $0.1 == 2 {
        chicks.append((i, $0.0))
      }
    }
}

go(0, [])

func go(_ cnt: Int, _ selected: [(Int, Int)]) {
  
  /// 다 골랐어
  if cnt == chicks.count {
    
    guard !selected.isEmpty && selected.count <= M else { return }
    
    /// 각 집의 치킨거리, 모든 치킨 집중에 가장 짧은 거리가 들어가야함
    var minHome = Array(repeating: 1000, count: homes.count)
    
    for chicken in selected {
      
      for homeIndex in (0..<homes.count) {
       
        let length = abs(chicken.0 - homes[homeIndex].0) + abs(chicken.1 - homes[homeIndex].1)
        
        minHome[homeIndex] = min(minHome[homeIndex], length)
      }
    }
    
    realTotal = min(realTotal, minHome.reduce(0, +))
    
    return
  }
  
  go(cnt+1, selected + [chicks[cnt]])
  go(cnt+1, selected)
}

print(realTotal)
