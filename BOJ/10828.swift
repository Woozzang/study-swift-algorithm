var count = Int(readLine()!)!
var stack = [Int]()

for _ in 0..<count {
  let line = readLine()!.split(separator: " ")

  let command = String(line.first!)
  
  switch command {
    case "push":
      stack.append(Int(line[1])!)
    case "pop":
      if stack.isEmpty {
        print("-1")
      } else {
        print(stack.removeLast())
      }
    case "size":
      print(stack.count)
    case "empty":
      stack.isEmpty ? print("1") : print("0")
    case "top":
      stack.isEmpty ? print("-1") : print(stack.last!)
    default:
      continue
  }
}