/// https://school.programmers.co.kr/learn/courses/30/lessons/92335

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
  var n = n
  var chars = [Character]()
  
	/// k진수로 바꾸기
  while n >= k {
    let tmp = n % k
    chars.append(Character("\(tmp)"))
    n = n / k
  }
  
  chars.append(Character("\(n)"))
  
  chars = chars.reversed()
  
	/// 0을 기준으로 나누면 조건에 충족하는 소수임
  return String(chars).split(separator: "0").filter {
    isPrime(Int($0)!)
  }.count
  
}

func isPrime(_ value: Int) -> Bool {
  
  guard value != 1 else { return false }
  
  var tmp = 2
  
  while tmp < Int(sqrt(Double(value))) + 1 {
    
    if value.isMultiple(of: tmp) { return false }
    
    tmp += 1
  }
  
  return true
}
