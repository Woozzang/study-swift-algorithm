import Foundation

extension String {
  func toAscciValue() -> Int {
    Int(UnicodeScalar(self)!.value)
  }
}

extension Int {
  func toString() -> String {
    String(UnicodeScalar(self)!)
  }
}

let origin = readLine()!

let bigA = "A".toAscciValue()
let smallA = "a".toAscciValue()

var resultArr: String = ""

for char in origin {
  if char.isUppercase {
    
    let result = bigA + (((String(char).toAscciValue() - bigA) + 13) % 26)
    
    resultArr.append(result.toString())
    
  } else if char.isLowercase{
    
    let result = smallA + (((String(char).toAscciValue() - smallA) + 13) % 26)
    
    resultArr.append(result.toString())
    
  } else {
    
    resultArr.append(String(char))
  }
}

print(resultArr)
