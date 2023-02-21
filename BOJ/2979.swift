
let fares = readLine()!.split(separator: " ").compactMap { Int($0) }

var cnt = Array(repeating: 0, count: 104)

(0...2).forEach { _ in
  
  let range = readLine()!.split(separator: " ").compactMap { Int($0) }
  
  (range[0] ..< range[1]).forEach { time in
    cnt[time] += 1
  }
}

let result = cnt.reduce(0) { partialResult, value in
  
  if value == 0 { return partialResult }
  
  return partialResult + (fares[value - 1] * value)
}

print(result)
