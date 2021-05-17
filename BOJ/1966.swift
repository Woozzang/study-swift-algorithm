func solution() {
  let testCount = Int(readLine()!)!
  var answer: [Int] = .init()
  
  for _ in (1...testCount) {
    let conditionList = readLine()!.split(separator: " ").map { Int(String($0))! }
    let targetIndex = conditionList[1]
    
    var givenList = readLine()!.split(separator: " ").map { Int(String($0))! }
    var zippedList = Array(givenList.enumerated())
    
    var rank = 1
    let target = zippedList[targetIndex]

    
    while !zippedList.isEmpty {
      if (zippedList.first!.1 == zippedList.max { $0.1 < $1.1 }!.1) {

        let number = zippedList.removeFirst()

        if number.0 == target.0 && number.1 == target.1 {
            answer.append(rank)
            continue
          } else {
            rank += 1
          }
        } else {
          zippedList.append(zippedList.first!)
          zippedList.removeFirst()
        }
    }
  }
  
  answer.forEach { print($0) }
}

solution()
