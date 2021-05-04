func solution() {
  let count = Int(readLine()!)!
  var list = [String]()
  
  for _ in 1...count {
    list.append(readLine()!)
  }
  
  Set(list).sorted { (lhs, rhs) -> Bool in
    lhs.count == rhs.count ? lhs < rhs : lhs.count < rhs.count
  }.forEach { print($0) }
  
}

solution()

