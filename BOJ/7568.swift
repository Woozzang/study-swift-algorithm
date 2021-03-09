import Foundation

let numOfPeople = Int(readLine()!)!
var peopleList = [(Int, Int)]()
var rankingList = [Int](repeating: 1, count: numOfPeople)

for _ in 0..<numOfPeople {
  let dummy = readLine()!.split(separator: " ").map { Int($0)! }
  peopleList.append( (dummy[0], dummy[1]) )
}

for i in 0..<numOfPeople {
  let base = peopleList[i]
  
  for j in 0..<numOfPeople {
    if(i == j) { continue }
    
    let comparing = peopleList[j]
    if base.0 < comparing.0 && base.1 < comparing.1 { rankingList[i] += 1 }
  }
}

for ranking in rankingList {
  print("\(ranking) ", separator: "", terminator: "")
}
