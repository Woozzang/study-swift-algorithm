import Foundation

let cnt = readLine()!.compactMap { Int(String($0)) }
let total = Int(readLine()!)!

var set = Set<Int>()

var result = 0

readLine()!
  .split(separator: " ")
  .compactMap { Int(String($0)) }
  .forEach {
    set.update(with: $0)
  }

set.sorted(by: <)
  .forEach {
    if set.contains(total - $0),
       total - $0 != $0
    {
      
      set.remove(total - $0)
      set.remove($0)
      
      result += 1
    }
  }

print(result)
