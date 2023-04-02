import Foundation

var maxCount = 1
var maxHeight = 0

let n = Int(readLine()!)!
var map = [[Int]]()
var visited = [[Int]]()

for _ in (0..<n) {
  let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
  
  maxHeight = max(maxHeight, arr.max()!)
  
  map.append(arr)
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func dfs(_ y: Int, _ x: Int, _ fillHeight: Int) {
  
  for (dy, dx) in zip(dy, dx) {
    let ny = y + dy
    let nx = x + dx
    
    if ny < 0 || ny >= n { continue }
    if nx < 0 || nx >= n { continue }
    
    if map[ny][nx] > fillHeight && visited[ny][nx] == 0 {
      visited[ny][nx] = 1
      dfs(ny, nx, fillHeight)
    }
  }
}

for fillHeight in (1...maxHeight) {
  
  visited = Array(repeating: Array(repeating: 0, count: n), count: n)
  var rst = 0
  
  for y in (0..<n) {
    for x in (0..<n) {
      if map[y][x] > fillHeight && visited[y][x] == 0 {
        visited[y][x] = 1
        dfs(y, x, fillHeight)
        rst += 1
      }
    }
  }
  
  maxCount = max(maxCount, rst)
}

print(maxCount)
