import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]

let dy = [-1, 0, 1, 0]
let dx = [0, -1, 0, 1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: M), count: N)
var component = [(Int, Int)]()

for _ in (0..<N) {
  map.append(readLine()!.map{ $0 == "W" ? 0 : 1} )
}

var rst = 0

func bfs(_ y: Int, _ x: Int) {
  
  var queue = [(y, x)]
  
  var dst = Array(repeating: Array(repeating: 0, count: M), count: N)
  
  dst[y][x] = 1
  
  var idx = 0
  
  while idx < queue.count {
    
    let here = queue[idx]
    
    let y = here.0
    let x = here.1
    
    for (dy, dx) in zip(dy, dx) {
      
      let ny = y + dy
      let nx = x + dx
      
      if ny < 0 || ny >= N { continue }
      if nx < 0 || nx >= M { continue }
      
      if map[ny][nx] == 1 && dst[ny][nx] == 0 {
        dst[ny][nx] = dst[y][x] + 1
        rst = max(rst,  dst[ny][nx])
        queue.append((ny,nx))
      }
    }
    
    idx += 1
  }
}

for j in (0..<N) {
  for i in (0..<M) {
    
    if map[j][i] == 1 {
      bfs(j,i)
    }
  }
}

print(rst-1)
