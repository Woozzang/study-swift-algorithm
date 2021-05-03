func main() {
  let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
  let givenNumber = line[1]
  let cardList = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
  
  var result: Int = 0

  for i in cardList.indices {
    for j in cardList.indices {
      for k in cardList.indices {
        if i == j || j == k || k == i {
          continue
        }
        
        let sum = cardList[i] + cardList[j] + cardList[k]
        if sum <= givenNumber {
          result = max(result, sum)
        }
      }
    }
  }
  print(result)
}

main()
