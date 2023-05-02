
/// https://school.programmers.co.kr/learn/courses/30/lessons/60057

import Foundation

func solution(_ s:String) -> Int {
  
  let chars = [Character](s)
    
  var rst = s.count

  /// 1개 단위, 2개단위, 3개 단위.. n개 단위
  for step in (1..<s.count) {
    
    guard chars.count > 1 else {
      return 1
    }
    
    var prev = [Character](chars[0..<step])
    var cnt = 1
    var tmp: String = ""
    
    for startIndex in stride(from: step, through: s.count - 1, by: step) {

      guard startIndex+step <= s.count else {
        prev.append(contentsOf: [Character](chars[startIndex..<s.count]))
        break
      }
      
      let curr = chars[startIndex..<startIndex+step]
      
      if String(prev) == String(curr) {
        
        cnt += 1
        
      } else {
        
        if cnt == 1 {
          tmp.append(String(prev))
          prev = [Character](curr)
          cnt = 1
        } else {
          tmp.append("\(cnt)"+String(prev))
          prev = [Character](curr)
          cnt = 1
        }
      }
    }
    
    if cnt == 1 {
      tmp.append(String(prev))
    } else {
      tmp.append("\(cnt)"+String(prev))
    }
    
    rst = min(rst, tmp.count)
  }
  
  return rst
}
