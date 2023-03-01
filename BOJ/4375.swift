import Foundation

while let input = Int(readLine() ?? "") {
  var val = 1
  var ret = 1
  
  while true {
    if val.isMultiple(of: input) {
      print(ret)
      break
    } else {
      val = (val * 10) + 1
      val %= input
      ret += 1
    }
  }
}

