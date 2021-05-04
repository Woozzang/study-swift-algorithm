import Foundation

func solution() {
  let numbers = readLine()!.split(separator: " ").map { Int(String( $0 ))!}
  var first = numbers[0]
  var second = numbers[1]
  
  var sosuList = [Int]()
  
  // 모두 1 인 경우
  guard numbers.max()! > 1 else {
    print(1); print(1)
    return
  }
  
  // 최대공배수가 1인 경우
  guard Int(Double(numbers.max()!).squareRoot()) > 1 else {
    print(1);
    
    if first == second {
      print(first)
    } else {
      print(first * second)
    }
    
    return
  }
  
  // 필요한 소인수 찾기
  (2...numbers.max()!).forEach {
    let squareRoot = Int(Double($0).squareRoot())
    for i in sosuList {
      if i > squareRoot { break }
      if $0.isMultiple(of: i) { return }
    }
    sosuList.append($0)
  }
  
  // 소인수 분해 자료구조 초기화
  var firstDict: [Int:Int] = [:]
  var secondDict: [Int: Int] = [:]

  sosuList.forEach {
    firstDict.updateValue(0, forKey: $0)
    secondDict.updateValue(0, forKey: $0)
  }
  
  // 소인수 분해
  sosuList.forEach {
    while first.isMultiple(of: $0) {
      first /= $0
      firstDict.updateValue(firstDict[$0]! + 1, forKey: $0)
    }
    
    while second.isMultiple(of: $0) {
      second /= $0
      secondDict.updateValue(secondDict[$0]! + 1, forKey: $0)
    }
  }
  
  // 최대 공약수, 최소 공배수
  var choiDae = 1
  var choiSoe = 1
  sosuList.forEach {
    let minCount = min(firstDict[$0]!, secondDict[$0]!)
    let maxCount = max(firstDict[$0]!, secondDict[$0]!)
    
    if minCount > 0 {
      for _ in 1...minCount {
        choiDae *= $0
      }
    }
    
    if maxCount > 0 {
      for _ in 1...maxCount {
        choiSoe *= $0
      }
    }
  }
  
  print(choiDae)
  print(choiSoe)
}

solution()
