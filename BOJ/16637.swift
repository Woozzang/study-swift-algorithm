import Foundation

var num = [Int]()
var op = [Character]()
var rst = Int.min

func main() {
  let n = Int(readLine()!)!
  
  readLine()!.forEach {
    if $0.isNumber {
      num.append(Int(String($0))!)
    } else {
      op.append($0)
    }
  }
  go(0, num[0])
  print(rst)
}

func op(_ op: Character, _ lhs: Int, _ rhs: Int) -> Int {
  if op == "+" {
    return lhs + rhs
  }
  if op == "*" {
    return lhs * rhs
  }
  if op == "-" {
    return lhs - rhs
  }
  
  return -1
}

func go(_ idx: Int, _ sum: Int) {
  guard idx < num.count - 1 else {
    rst = max(rst, sum)
    return
  }
  
  go(idx + 1, op(op[idx], sum, num[idx + 1]))
  
  if idx + 2 < num.count {
    let tmp = op(op[idx+1], num[idx + 1], num[idx + 2])
    go(idx + 2, op(op[idx], sum, tmp))
  }
}

main()
