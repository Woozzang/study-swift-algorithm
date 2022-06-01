import Foundation

func solution() {
  var list = Array(repeating: 0, count: 1001)
  let n = Int(readLine()!)!
  
  func dp(cnt: Int) -> Int {
    if cnt == 1 {
      return 1
    }
    
    if cnt == 2 {
      return 2
    }
    
    if list[cnt] != 0 {
      return list[cnt]
    }

    list[cnt] = (dp(cnt: cnt-1) + dp(cnt: cnt-2)) % 10007
    return list[cnt]
  }
  print(dp(cnt: n))
}

solution()
