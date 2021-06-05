func solution() {
  let count = Int(readLine()!)!
  var list: [(Int, Int)] = .init()
  
  for _ in (0..<count) {
    let tmp = readLine()!.split(separator: " ")
    list.append((Int(tmp[0])!, Int(tmp[1])!))
  }
  
  list.sorted { lhs, rhs in
    lhs.0 == rhs.0 ? lhs.1 < rhs.1 : lhs.0 < rhs.0
  }.forEach {
    print("\($0.0) \($0.1)")
  }
}

solution()
