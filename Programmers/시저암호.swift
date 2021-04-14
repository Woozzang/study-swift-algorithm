func solution(_ s:String, _ n:Int) -> String {
  return s.utf8.map {
    switch $0 {
    case Character("a").asciiValue! ... Character("z").asciiValue!:
      return String(UnicodeScalar((($0 + UInt8(n)) - Character("a").asciiValue!) % 26 + Character("a").asciiValue!))
    case Character("A").asciiValue! ... Character("Z").asciiValue!:
      return String(UnicodeScalar((($0 + UInt8(n)) - Character("A").asciiValue!) % 26 + Character("a").asciiValue!))
    default:
      return String(UnicodeScalar($0))
    }
  }.joined()
}
