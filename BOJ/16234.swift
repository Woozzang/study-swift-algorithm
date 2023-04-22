import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

let N = inputs[0]
let L = inputs[1]
let R = inputs[2]

let dy = [-1, 0, 1, 0]
let dx = [0, -1, 0, 1]

var map = [[Int]]()
var tmpMap = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: N), count: N)

for _ in (0..<N) {
  let line = readLine()!.split(separator: " ").compactMap { Int($0)}
  map.append(line)
  tmpMap.append(line)
}

var components = [(Int, Int)]()

var day = 0

while true {
  
  var changed = false
  
  for j in (0..<N) {
    for i in (0..<N) {
      visited[j][i] = 1
      bfs(j, i, &changed)
    }
  }
  
  if !changed { break }
  
  map = tmpMap
  
  day += 1
  
  visited = Array(repeating: Array(repeating: 0, count: N), count: N)
}

print(day)

func bfs(_ y: Int, _ x: Int, _ changed: inout Bool) {
  
  var queue = [(y, x)]
  var component = [(y, x)]
  
  var idx = 0
  
  while idx < queue.count {
    let here = queue[idx]
    
    let y = here.0
    let x = here.1
    
    for (dy, dx) in zip(dy, dx) {
      let ny = y + dy
      let nx = x + dx
      
      if ny < 0 || ny >= N { continue }
      if nx < 0 || nx >= N { continue }
      
      let diff =  abs(map[y][x] - map[ny][nx])
      
      if diff >= L && diff <= R && visited[ny][nx] == 0 {
        visited[ny][nx] = 1
        component.append((ny, nx))
        queue.append((ny, nx))
      }
    }
    
    idx += 1
  }
  
  guard component.count != 1 else {
    return
  }
  
  changed = true
  
  // 연합 각 인구수 계산
  let value = component.map { map[$0.0][$0.1] }.reduce(0, +) / component.count
  
  component.forEach {
    tmpMap[$0.0][$0.1] = value
  }
}
