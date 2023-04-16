import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
let M = inputs[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: M), count: N)

// 맵 만들기
for _ in (0..<N) {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  map.append(line)
}

// 최초 치즈조각 칸수
var cnt = 0

for y in (0..<N) {
  for x in (0..<M) {
    if map[y][x] == 1 {
      cnt += 1
    }
  }
}

let dy = [-1, 0 ,1, 0]
let dx = [0, 1, 0, -1]
var melting = [(Int, Int)]()

func dfs(_ y: Int, _ x: Int) {
  
  visited[y][x] = 1
  
  if map[y][x] == 1 {
    melting.append((y, x))
    return
  }
  
  for (dy, dx) in zip(dy, dx) {
    let ny = y + dy
    let nx = x + dx
    
    if ny < 0 || ny >= N { continue }
    if nx < 0 || nx >= M { continue }
    
    if map[ny][nx] == -1 { continue }
    
    if visited[ny][nx] == 0 {
      dfs(ny, nx)
    }
  }
}

for i in (1...) {

  dfs(0,0)
  
  // 녹기
  melting.forEach {
    map[$0.0][$0.1] = 0
  }
  
  var thisCnt = 0
  
  for y in (0..<N) {
    for x in (0..<M) {
      if map[y][x] == 1 {
        thisCnt += 1
      }
    }
  }
  
  // 다 녹았으면
  if thisCnt == 0 {
    print(i)
    print(melting.count)
    break
  } else {
    melting.removeAll()
  }
  
  visited = Array(repeating: Array(repeating: 0, count: M), count: N)
}


