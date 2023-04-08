import Foundation

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
var bar = (0, inputs[1]-1)

let j = Int(readLine()!)!
var rst = 0

for _ in (0..<j) {
  let apple = Int(readLine()!)! - 1
  
  if (bar.0 ... bar.1).contains(apple) {
    continue
  }
  
  if apple < bar.0 {
    goLeft(&bar)
    /// 닿을 때 까지
    while bar.0 != apple {
      goLeft(&bar)
    }
    continue
  }
  
  if apple > bar.1 {
    goRight(&bar)
    /// 닿을 때 까지
    while bar.1 != apple {
      goRight(&bar)
    }
    continue
  }
}

func goLeft(_ bar: inout (Int, Int)) {
  guard bar.0 - 1 >= 0 else {
    return
  }
  
  bar = (bar.0-1, bar.1-1)
  
  rst += 1
}

func goRight(_ bar: inout (Int, Int)) {
  guard bar.1 + 1 < N else {
    return
  }
  
  bar = (bar.0+1, bar.1+1)

  rst += 1
}

print(rst)
