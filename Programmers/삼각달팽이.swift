///https://school.programmers.co.kr/learn/courses/30/lessons/68645

import Foundation

/**
 - 3가지 방향
     - 아래로 (y+1)
     - 오른쪽으로(x+1)
     - 위로 (y-1, x-1)
 */

let dy = [1,0,-1]
let dx = [0,1,-1]



func solution(_ n:Int) -> [Int] {
  
  var n = n
  
  var triangle = Array(repeating: Array(repeating: 0, count: n), count: n)
  /// 0, 1, 2, 0, 1, 2 ....
  var index = 0
  
  var current = (-1, 0)
  
  var value = 1
  
  while n != 0 {
    
    /// 한가지 방향으로 n 회 반복하여 그림
    for _ in (1...n) {
      
      /// 방향으로 이동시키고
      current = (current.0 + dy[index % 3], current.1 +  dx[index % 3])
      
      /// 값 적고
      triangle[current.0][current.1] = value
      
      /// 다음 값 만들고
      value += 1
    }
    
    index += 1
    n -= 1
  }
  
  triangle.forEach { print($0) }
  
  return triangle.flatMap { arr in
    return arr.filter { $0 != 0 }
  }
}

print(solution(5))
