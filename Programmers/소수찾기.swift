import Foundation

func solution(_ n:Int) -> Int {
    
  var sosuList:[Int] = .init()
  var isSosu: Bool = true
    
  for number in 2...n {
    if sosuList.isEmpty {
      sosuList.append(number)
      continue
    }
    
    isSosu = true
    for sosu in sosuList {
        if Int(sqrt(Double(n))) < sosu {
            break
        }
      if number % sosu == 0 {
        isSosu = false
        break
      }
    }
    
    if isSosu {
      sosuList.append(number)
    }
  }
  
  return sosuList.count
}