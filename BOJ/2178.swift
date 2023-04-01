import Foundation

let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = inputs[0]
let M = inputs[1]

var map = [[Int]]()

for _ in (0..<N) {
  map.append([Character](readLine()!).compactMap { Int(String($0)) })
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var queue = [(Int, Int)]()
var visited = Array(repeating: Array(repeating: 0, count: M), count: N)

func bfs(_ y: Int, _ x: Int) {
  queue.append((y, x))
  visited[y][x] = 1
  
  while !queue.isEmpty {
    let first = queue.removeFirst()
    
    for (y, x) in zip(dy, dx) {
      let ny = first.0 + y
      let nx = first.1 + x
      
      if ny < 0 || ny >= N { continue }
      if nx < 0 || nx >= M { continue }
      
      if map[ny][nx] == 1 && visited[ny][nx] == 0 {
        queue.append((ny, nx))
        visited[ny][nx] = visited[first.0][first.1] + 1
      }
    }
  }
}

bfs(0, 0)

print(visited[N-1][M-1])
