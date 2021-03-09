import Foundation

let roomNumber = [Character](readLine()!).map { Int(String($0))! }
var numOfRequiredSet = 0
// 0 ~ 9 의 카드 총 10장 의 각각의 개수
var owningSet = [Int](repeating: 0, count: 10)

for number in roomNumber {
 if owningSet[number] == 0 {
    if number == 6 && owningSet[9] > 0 { owningSet[9] -= 1; continue }
    else if number == 9 && owningSet[6] > 0 { owningSet[6] -= 1; continue }
    plusOneCardSet()
  }
  owningSet[number] -= 1
}

func plusOneCardSet() {
  numOfRequiredSet += 1
  owningSet = owningSet.map { $0 + 1 }
}

print(numOfRequiredSet)
