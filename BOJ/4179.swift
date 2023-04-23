import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

let R = inputs[0]
let C = inputs[1]

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var map = [[String]]()
var start = (-1, -1)

var fireVisited = Array(repeating: Array(repeating: Int.max, count: C), count: R)

var personVisited = Array(repeating: Array(repeating: 0, count: C), count: R)

var ret = 0

func solution() {
  
  var queue = [(Int, Int)]()
  
  for y in (0..<R) {
    let line = readLine()!.map { String($0) }
    
    for (x, string) in line.enumerated() {
      if string == "F" {
        queue.append((y, x))
        fireVisited[y][x] = 1
      }
      if string == "J" {
        start = (y, x)
        personVisited[y][x] = 1
      }
    }
    
    map.append(line)
  }
  
  var idx = 0
  
  while idx < queue.count {
    
    let here = queue[idx]
    
    let y = here.0
    let x = here.1
    
    for (dy, dx) in zip(dy, dx) {
      let ny = y + dy
      let nx = x + dx
      
      if ny < 0 || nx < 0 || ny >= R || nx >= C { continue }
      
      if fireVisited[ny][nx] != Int.max || map[ny][nx] == "#" { continue}

      fireVisited[ny][nx] = fireVisited[y][x] + 1
      queue.append((ny, nx))
    }
    
    idx += 1
  }
  
  queue = [start]
  
  idx = 0
  
  while idx < queue.count {
    
    let here = queue[idx]
    
    let y = here.0
    let x = here.1
    
    if y == 0 || y == R-1 || x == 0 || x == C-1 {
      ret = personVisited[y][x]
      break
    }
    
    for (dy, dx) in zip(dy, dx) {
      let ny = y + dy
      let nx = x + dx
      
      if ny < 0 || nx < 0 || ny >= R || nx >= C { continue }
      
      if personVisited[ny][nx] != 0 || map[ny][nx] == "#" { continue }
      
      /// 빨라야 (시간이 덜걸려야) 갈수 있는 것임
      if fireVisited[ny][nx] <= personVisited[y][x] + 1 { continue }

      personVisited[ny][nx] = personVisited[y][x] + 1
      queue.append((ny, nx))
                   
    }
    
    idx += 1
  }
  
  if ret == 0 {
    print("IMPOSSIBLE")
  } else {
    print(ret)
  }
}

solution()
