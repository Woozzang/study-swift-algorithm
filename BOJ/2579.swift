func solution() {
  let count = Int(readLine()!)!
  var stair = [Int](repeating: 0, count: count + 1)
  var maxValue = [Int](repeating: 0, count: count + 1)
  
  (1...count).forEach { currentStep in
    let oneStepBefore = currentStep - 1
    let twoStepBefore = currentStep - 2
    let threeStepBefore = currentStep - 3
    
    let value = Int(readLine()!)!
    stair[currentStep] = value
    
    guard currentStep - 3 >= 0 else {
      maxValue[currentStep] = stair[currentStep] + maxValue[oneStepBefore]
      return
    }
    
    maxValue[currentStep] = max(maxValue[twoStepBefore] + stair[currentStep], maxValue[threeStepBefore] + stair[oneStepBefore] + stair[currentStep])
  }

  print(maxValue[count])
}

solution()
