import Foundation

var rst = Int.max

var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 64), count: 64), count: 64)

var _a = [
  [9, 3, 1],
  [9, 1, 3],
  [3, 1, 9],
  [3, 9 ,1],
  [1, 3, 9],
  [1, 9, 3]
]

func main() {
  var a = Array(repeating: 0, count: 3)
  
  let size = Int(readLine()!)!
  
  for (index, value) in readLine()!.split(separator: " ").compactMap { Int($0) }.enumerated() {
    a[index] = value
  }
  
  print(solve(a[0], a[1], a[2]))
}

struct A {
  var a: Int, b: Int, c: Int
}

func solve(_ a: Int, _ b: Int, _ c: Int) -> Int {
  
  var queue = [A(a: a, b: b, c: c)]
  
  /// ex) scv 의 초기 체력이 12 10 4 라면
  /// visited[12][10][4] = 1
  visited[a][b][c] = 1
  
  while !queue.isEmpty {
    let here = queue.removeFirst()
    
    let a = here.a
    let b = here.b
    let c = here.c
    
    if visited[0][0][0] != 0 { break }
    
    for move in _a {
      let na = max(0, a - move[0] )
      let nb = max(0, b - move[1] )
      let nc = max(0, c - move[2] )
      
      if visited[na][nb][nc] == 0 {
        visited[na][nb][nc] = visited[a][b][c] + 1
        queue.append(A(a: na, b: nb, c: nc))
      }
    }
  }
  
  return visited[0][0][0] - 1
}

main()
