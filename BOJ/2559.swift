import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }

let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

let sumCount = input[1]

var sums = Array(repeating: 0, count: arr.count)

for (index, element) in arr.enumerated() {
  
  if index == 0 {
    
    sums[index] = element
    
    continue
  }
  
  sums[index] = sums[index - 1] + element
}

var result: Int = sums[sumCount - 1]

for sumIndex in (sumCount..<sums.count) {

  result = max(result, sums[sumIndex] - sums[sumIndex - sumCount])
}

print(result)
