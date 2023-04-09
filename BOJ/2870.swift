import Foundation

let count = Int(readLine()!)!
var ints = [String]()

for _ in (1...count) {
  let str = readLine()!
  var chars = ""
  
  for (index, char) in str.enumerated(){
    
    if char.isNumber {
      chars.append(char)
    } else {
      if !chars.isEmpty {
        
        if chars.allSatisfy({ $0 == "0" }) {
          chars = "0"
        }
        
        if chars != "0"{
  
          while chars.first == "0" {
            chars.removeFirst()
          }
        }
        
        ints.append(chars)
        chars = ""
      }
    }
    
    if index == str.count - 1 {
      
      if !chars.isEmpty {
        
        if chars.allSatisfy({ $0 == "0" }) {
          chars = "0"
        }
        
        if chars != "0"{
          while chars.first == "0" {
            chars.removeFirst()
          }
        }
        
        ints.append(chars)
        chars = ""
      }
    }
  }
}

ints.sorted { lhs, rhs in
  if lhs.count < rhs.count {
    return true
  } else if lhs.count > rhs.count{
    return false
  } else {
    for (lc, rc) in zip(lhs, rhs) {
      if Int(String(lc))! > Int(String(rc))!{
        return false
      }
      if  Int(String(lc))! < Int(String(rc))! {
        return true
      }
    }
    return true
  }
}.forEach { print($0) }
