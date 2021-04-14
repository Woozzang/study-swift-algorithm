func solution(_ s:String) -> String {
  var index = 0
  return s.map {
    if $0.isWhitespace { index = 0; return String($0) }
    let str = index.isMultiple(of: 2) ? $0.uppercased() : $0.lowercased()
    index += 1
    return str
  }.joined()
}