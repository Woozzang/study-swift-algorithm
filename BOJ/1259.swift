func solution() {
  var original = readLine()!
  
  while original != "0" {
    if original == String(original.reversed()) {
      print("yes")
    } else {
      print("no")
    }
    original = readLine()!
  }
}

solution()

