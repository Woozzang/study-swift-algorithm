import Foundation

func solution() {
  let _ = readLine()!
  
  let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
  var sosuList = [Int]()
  
  (2...numbers.max()!).forEach {
    let squareRoot = Int(Double($0).squareRoot())
    
    for j in sosuList {
      if j > squareRoot { break }
      if $0.isMultiple(of: j) { return }
    }
    sosuList.append($0)
  }
  
  var answer = 0
  numbers.forEach {
    if sosuList.contains($0) { answer += 1 }
  }
  
  print(answer)
}

solution()

