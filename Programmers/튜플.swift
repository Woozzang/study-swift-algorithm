import Foundation

var arrs = [[Int]]()
var rst = [Int]()

func solution(_ s:String) -> [Int] {
  
  let input = [Character](s)
  
  var arr = [Character]()
  
	/// 가장 외곽의 "{" 와 "}" 제거를 위해
	/// for char in input[1..<input.count-1] 를 했는데 제출에서 한 케이스 런타임 에러 났음..
  for char in input {
    if char == "{" { continue }
    if char == "}" {
      arrs.append(String(arr).split(separator: ",").compactMap { Int($0) })
      arr.removeAll()
      continue
    }
    arr.append(char)
  }
  
  arrs.sort { lhs, rhs in
    lhs.count < rhs.count
  }
  
  var sum = 0
  
  for arr in arrs {
    
    if arr.count == 1 {
      rst = [arr[0]]
      sum = arr[0]
      continue
    }
    
    let tmp = arr.reduce(0, +) - sum
    sum += tmp
    
    rst.append(tmp)
  }
  
  return rst
}
