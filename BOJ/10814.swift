func solution() {
  let count = Int(readLine()!)!
  var list: [(Int, String)] = .init()
  
  for _ in (0..<count) {
    let tmp = readLine()!.split(separator: " ")
    list.append((Int(tmp[0])!, String(tmp[1])))
  }
  
  list.enumerated().sorted { lhs, rhs in
    lhs.element.0 == rhs.element.0 ? lhs.offset < rhs.offset : lhs.element.0 < rhs.element.0
  }.forEach {
    print("\($0.element.0) \($0.element.1)")
  }
}

solution()
