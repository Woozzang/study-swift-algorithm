///https://school.programmers.co.kr/learn/courses/30/lessons/12973

import Foundation

func solution(_ s:String) -> Int{

  var answer:Int = -1
  
  var stack = [Character]()

  s.forEach {
    if let last = stack.last {
      if last == $0 {
        _ = stack.popLast()
      } else {
        stack.append($0)
      }
    } else {
      stack.append($0)
    }
  }

  return stack.isEmpty ? 1 : 0
}
