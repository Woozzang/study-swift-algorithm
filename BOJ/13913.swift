///https://www.acmicpc.net/problem/13913

import Foundation

func solution() {
  
  let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
  
  var visited = Array(repeating: 0, count: 200_0004)
  var prev = Array(repeating: 0, count: 200_0004)
  
  var queue = [inputs[0]]
  visited[inputs[0]] = 1
  
  var rst = 0
  var idx = 0
  
  while idx < queue.count {
    
    let here = queue[idx]
    
    if here == inputs[1] {
      rst = visited[here]
      break
    }
    
    for there in [here-1, here+1, here*2] where there>=0&&there<visited.count {
      
      if visited[there] == 0 {
        queue.append(there)
        visited[there] = visited[here] + 1
        prev[there] = here
      }
    }
    
    idx += 1
  }
  
  var here = inputs[1]
  var arrs = [here]
  
  while here != inputs[0] {
    
    arrs.append(prev[here])
    
    here = prev[here]
  }
  
  print(rst-1)
  
  arrs.reversed().forEach { print($0, terminator: " ")}
}

solution()

