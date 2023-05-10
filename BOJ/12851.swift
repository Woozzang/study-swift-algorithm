/// https://www.acmicpc.net/problem/12851

import Foundation

var rst = 0

func solution() {
  
  let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
  
  /// 같은 위치에 있는 경우
  guard abs(inputs[1] - inputs[0]) != 0 else {
    print(0)
    print(1)
    return
  }
  
  var queue = [inputs[0]]
  
  var visited = Array(repeating: 0, count: 100_004)
  var cnt = Array(repeating: 0, count: 100_004)
  
  visited[inputs[0]] = 1
  cnt[inputs[0]] = 1
  
  while !queue.isEmpty {
    
    let here = queue.removeFirst()
    
    for there in move(here) {
      
      guard there >= 0 && there < visited.count else {
        continue
      }
      
      /// 해당 장소에 최초 접근
      if visited[there] == 0 {
        
        queue.append(there)
        
        visited[there] = visited[here] + 1
        
        cnt[there] = cnt[here]
        
      } else {
        
        if visited[there] == visited[here] + 1 {
          
          cnt[there] += cnt[here]
        }
      }

    }
  }
  
  print(visited[inputs[1]] - 1)
  print(cnt[inputs[1]])
}

func move(_ value: Int) -> [Int] {
  return [value-1, value+1, value*2]
}

solution()

