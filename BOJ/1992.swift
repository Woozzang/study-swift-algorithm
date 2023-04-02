/**
0-7 8-15
0-15

3
(y2-1) / 2
 */

var map = [[Int]]()

func quadTree(y1: Int, x1: Int, size: Int) -> String {
  
  var value: Int?
  
  guard size > 0 else { return "" }
  
  for x in (x1..<x1+size) {
    for y in (y1..<y1+size) {
      if let value = value {
        if map[x][y] != value {
          
          let size = size / 2
          
          return "(\(quadTree(y1: y1, x1: x1, size: size) + quadTree(y1: y1 + size, x1: x1, size: size) + quadTree(y1: y1, x1: x1 + size, size: size) + quadTree(y1: y1 + size, x1: x1 + size, size: size)))"
          
        }
      } else {
        value = map[x][y]
      }
    }
  }
  
  return "\(value!)"
}

func solution() -> String {
  
  let N = Int(readLine()!)!
  
  for _ in (0..<N) {
    map.append([Character](readLine()!).compactMap { Int(String($0)) })
  }
  
  var value: Int?
  
  for x in (0..<N) {
    for y in (0..<N) {
      if let value = value {
        if map[x][y] != value {
          
          let y1 = 0
          let size = N / 2
          let x1 = 0
          
          return "(\(quadTree(y1: y1, x1: x1, size: size) + quadTree(y1: y1 + size, x1: x1, size: size) + quadTree(y1: y1, x1: x1 + size, size: size) + quadTree(y1: y1 + size, x1: x1 + size, size: size)))"
          
        }
      } else {
        value = map[x][y]
      }
    }
  }
  
  return "\(value!)"
}

print(solution())
