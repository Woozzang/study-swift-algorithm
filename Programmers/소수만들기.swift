import Foundation

func solution(_ nums:[Int]) -> Int {
    
  var answer = 0
  var numberList: [Int] = .init()
    
    for firstIndex in 0...nums.count - 3 {
        for secondIndex in firstIndex + 1 ... nums.count - 2 {
            for thirdIndex in secondIndex + 1 ... nums.count - 1 {
              numberList.append(nums[firstIndex] + nums[secondIndex] + nums[thirdIndex])
            }
        }
    }
  
  numberList.forEach {
    for number in (2...Int(Double($0).squareRoot())) {
      if $0.isMultiple(of: number) {
        return
      }
    }
    answer += 1
  }
    
  return answer
}
