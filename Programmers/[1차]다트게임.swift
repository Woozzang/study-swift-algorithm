func power(number: Int,count: Int) -> Int {
  var baseNumber = 1
  for _ in (1...count) {
    baseNumber *= number
  }
  return baseNumber
}

func solution(_ dartResult:String) -> Int {
  let dartResult = Array(dartResult)
  var index = 0
  var scoreList: [Int] = .init()
  
  while index < dartResult.count {
    var currentChar = dartResult[index]
    var baseNumber = 1
    
    guard currentChar.isNumber else { break }
    
    var numberList: [Character] = .init()
    
    while currentChar.isNumber {
      numberList.append(currentChar)
      index += 1
      currentChar = dartResult[index]
    }
    
    baseNumber *= Int(String(numberList))!
    
    guard currentChar.isUppercase else { break }
    
    switch currentChar {
    case "D":
      baseNumber = power(number: baseNumber, count: 2)
    case "T":
      baseNumber = power(number: baseNumber, count: 3)
    default:
      break
    }
    index += 1
    
    guard index < dartResult.count else {
      print(baseNumber)
      scoreList.append(baseNumber)
      break
    }
    
    currentChar = dartResult[index]
    guard currentChar == "*" || currentChar == "#" else {
      scoreList.append(baseNumber)
      continue
    }
    
    switch currentChar {
    case "*":
      baseNumber *= 2
      if !scoreList.isEmpty {
        scoreList[scoreList.endIndex - 1] *= 2
      }
    case "#":
      baseNumber = -baseNumber
    default:
      break
    }
    index += 1
    
    scoreList.append(baseNumber)
  }
  
  return scoreList.reduce(0, +)
}
