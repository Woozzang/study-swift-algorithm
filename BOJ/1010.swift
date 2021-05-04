func combi(_ n: Int, _ r: Int) -> Int {
  var p = 1
  
  guard n-r > 0 else {
    return 1
  }
  
  for i in 1...n-r {
    p = p * (n - i + 1) / i
  }
  return p
}

func solution() {
  let count = Int(readLine()!)!
  
  (1...count).forEach { _ in
    let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    print(combi(numbers[1], numbers[0]))
  }
}

solution()

