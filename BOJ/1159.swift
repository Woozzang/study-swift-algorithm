/// dictionary 활용 방식
let count = Int(readLine()!)!
var wordCount = [Character: Int]()

(0..<count).forEach { _ in
  
  let name = readLine()!
  
  wordCount.updateValue((wordCount[name.first!] ?? 0) + 1, forKey: name.first!)
}

let array = wordCount.sorted(by: <).filter { $0.value >= 5}

if array.isEmpty {
  print("PREDAJA")
} else {
  array.forEach { print($0.key, terminator: "") }
}

/// array 활용 방식
extension String {
  func toAscii() -> Int {
    Int(UnicodeScalar(self)!.value)
  }
}

extension Int {
  func toString() -> String {
    String(UnicodeScalar(self)!)
  }
}

let offset = "a".toAscii()
var cnt = [Int](repeating: 0, count: 26)

let count = Int(readLine()!)!

(0..<count).forEach { _ in
  
  let firstChar = readLine()!.first!
  
  let index = String(firstChar).toAscii() - offset
  
  cnt[index] += 1
}

let indexedArray = cnt.enumerated().filter { $1 >= 5}

if indexedArray.isEmpty {
  print("PREDAJA")
} else {
  
  indexedArray.forEach {
    if $1 >= 5 {
      print(($0 + offset).toString(), terminator: "")
    }
  }
}
