import Foundation

var N = -1
var M = -1
var map = [[Int]]()
var visited = [[Int]]()

var zeros = [(Int, Int)]()
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func dfs(_ y: Int, _ x: Int) {
  
  for y in (0..<N) {
    for x in (0..<M) {
      
      if map[y][x] == 2 && visited[y][x] == 0 {
        
        visited[y][x] = 1
        
        for (dy, dx) in zip(dy, dx) {
          let ny = y + dy
          let nx = x + dx
          
          if ny < 0 || ny >= N { continue }
          if nx < 0 || nx >= M { continue }
          
          if map[ny][nx] == 0 {
            map[ny][nx] = 2
            dfs(ny, nx)
          }
        }
      }
    }
  }
}

func main() {
  
  let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
  N = inputs[0]
  M = inputs[1]
  
  for y in (0..<N) {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(line)
    line.enumerated().forEach {
      if $0.1 == 0 { zeros.append((y, $0.0))}
    }
  }
  
  let origin = map

  var result = 0
  
  /// 조합
  for i in (0..<zeros.count) {
    for j in (i+1..<zeros.count) {
      for k in (j+1..<zeros.count) {
        
        visited = Array(repeating: Array(repeating: 0, count: M), count: N)
        
        map[zeros[i].0][zeros[i].1] = 1
        map[zeros[j].0][zeros[j].1] = 1
        map[zeros[k].0][zeros[k].1] = 1
        
        dfs(0, 0)
        
        var caseReult = 0
        
        for y in (0..<N) {
          for x in (0..<M) {
            if map[y][x] == 0 {
              caseReult += 1
            }
          }
        }
        
        result = max(result, caseReult)
        
        map = origin
      }
    }
  }
  
  print(result)
}

main()
