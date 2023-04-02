let inputs = readLine()!.split(separator:" ").compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]
let K = inputs[2]

var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = map

for _ in (1...K) {
  let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
  
  for y in inputs[1]..<inputs[3] {
    for x in inputs[0]..<inputs[2] {
      map[y][x] = 1
    }
  }
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func dfs(_ y: Int, _ x: Int) -> Int {
  
  var rst = 1

  for (dy, dx) in zip(dy, dx) {
    let ny = y + dy
    let nx = x + dx
    
    if ny < 0 || ny >= N || nx < 0 || nx >= M {
      continue
    }
    
    if map[ny][nx] == 0 && visited[ny][nx] == 0 {
      visited[ny][nx] = 1
      rst += dfs(ny, nx)
    }
  }
  
  return rst
}

var rst = 0
var width = 0
var widths = [Int]()

for y in (0..<N) {
  for x in (0..<M) {
    if map[y][x] == 0 && visited[y][x] == 0 {
      visited[y][x] = 1
      rst += 1
      widths.append(dfs(y,x))
    }
  }
}

print(rst)
widths.sorted(by: <).forEach { print($0, terminator: " ")}
