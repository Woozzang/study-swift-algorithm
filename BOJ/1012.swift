import Foundation

let dy = [-1, 0 , 1, 0]
let dx = [0, 1, 0, -1]

func dfs(_ y: Int, _ x: Int, _ N: Int, _ M: Int) {
  
  for (dy, dx) in zip(dy, dx) {
    
    let ny = y + dy
    let nx = x + dx
    
    if ny < 0 || ny >= N { continue }
    if nx < 0 || nx >= M { continue }
    
    if map[ny][nx] == 1 && visited[ny][nx] == 0 {
      
      visited[ny][nx] = 1
      
      dfs(ny, nx, N, M)
    }
  }
}

var visited = [[Int]]()
var map = [[Int]]()
var rst = 0

func solution() {
  
  let testCounts = Int(readLine()!)!
  
  for _ in 0..<testCounts {
    
    let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

    let M = inputs[0]
    let N = inputs[1]
    let K = inputs[2]
    
    visited = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    map = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for _ in 0..<K {
      let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
      map[inputs[1]][inputs[0]] = 1
    }
    
    for y in (0..<N) {
      for x in (0..<M) {
        
        if map[y][x] == 1 && visited[y][x] == 0 {
          
          dfs(y, x, N, M)
          
          rst += 1
        }
      }
    }
    
    print(rst)
    
    visited.removeAll()
    map.removeAll()
    rst = 0
  }
}

solution()


