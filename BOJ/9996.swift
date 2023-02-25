let count = Int(readLine()!)!

let patterns = readLine()!.split(separator: "*").compactMap { String($0) }

for _ in (1...count) {
  let stc = readLine()!

  guard !stc.isEmpty else {
    print("NE")
    continue
  }
  
  guard stc.count - patterns[0].count - patterns[1].count >= 0 else {
    print("NE")
    continue
  }

  let postFix = String(stc.dropFirst(stc.count - patterns[1].count))
  
  if stc.prefix(patterns[0].count) == patterns[0] &&
      postFix == patterns[1] {
    print("DA")
  } else {
    print("NE")
  }
}
