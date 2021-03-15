var count = Int(readLine()!)!
var list = [Int]()

for _ in 0..<count {
  list.append(Int(readLine()!)!)
}

list.sorted().forEach { print($0) }
