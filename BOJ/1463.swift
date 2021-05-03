func solution () {
let number = Int(readLine()!)!
  
var countList = [Int](repeating: 0, count: number + 1)

  guard number > 1 else { print(0); return  }
  
  (2...number).forEach { index in
    
    countList[index] = countList[index - 1] + 1
    
    if index % 3 == 0 {
      countList[index] = min(countList[index], countList[index/3] + 1)
    }
    
    if index % 2 == 0 {
      countList[index] = min(countList[index], countList[index/2] + 1)
    }
  }
  print(number == 1 ? 0 : countList[number])
}

solution()
