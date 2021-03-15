var count = Int(readLine()!)!
var queue = [Int]()

for _ in 0..<count {
  let line = readLine()!.split(separator: " ")

  let command = String(line.first!)
  
  switch command {
    case "push":
      queue.append(Int(line[1])!)
    case "pop":
      if queue.isEmpty {
        print("-1")
      } else {
        print(queue.removeFirst())
      }
    case "size":
      print(queue.count)
    case "empty":
      queue.isEmpty ? print("1") : print("0")
    case "front":
      queue.isEmpty ? print("-1") : print(queue.first!)
    case "back":
      queue.isEmpty ? print("-1") : print(queue.last!)
    default:
      continue
  }
}