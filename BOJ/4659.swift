/// solution1
import Foundation

func one(_ str: String) -> Bool {
  str.contains("a") || str.contains("e") || str.contains("i") || str.contains("o") || str.contains("u")
}

func two(_ str: String) -> Bool {
  var arr = [Bool]()
  
  str.forEach {
    if $0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u" {
      arr.append(true)
    } else {
      arr.append(false)
    }
  }
  
  var sumArr = [Int]()
  
  var sum = 1
  
  var past = arr[0]
  
  guard arr.count > 1 else { return true }
  
  arr[1...].forEach {
    if $0 == past {
      sum += 1
      past = $0
    } else {
      sumArr.append(sum)
      past = $0
      sum = 1
    }
  }
  
  sumArr.append(sum)
  
  return sumArr.filter { $0 >= 3}.isEmpty
}

func three(_ str: String) -> Bool {
  /// 어떤 문자가 2개 이상 연속으로 있는지 확인
  
  guard str.count > 1 else { return true }
  
  var rst = false
  
  let str = [Character](str)
  
  for (index, value) in str.enumerated() {
    
    if index >= str.count - 1 { break }
    
    if Array(str[index...index+1]) == Array(repeating: value, count: 2) {
      if value == "e" || value == "o" {
        rst = true
      } else {
        rst = false
        break
      }
    } else {
      rst = true
    }
  }
  
  return rst
}


while let input = readLine() {
  guard input != "end" else { break }
  if one(input) && two(input) && three(input) {
   print("<\(input)> is acceptable.")
  } else {
    print("<\(input)> is not acceptable.")
  }
}

/// solution2
import Foundation

func isVowel(_ char: Character) -> Bool {
  char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
}
/// 모음 : vowel
/// 자음 : consonants
func main() {
  while true {
    let str = readLine()!
    if str == "end" { break }
    var ccnt = 0; var vcnt = 0;
    var flag = false
    var isVowelIncluded = false
    var prev: Character = " "
    
    for (index, char) in str.enumerated() {
      if isVowel(char) {
        vcnt += 1
        ccnt = 0
        isVowelIncluded = true
      } else {
        ccnt += 1
        vcnt = 0
      }
      
      if vcnt == 3 || ccnt == 3 {
        flag = true
        break
      }
      
      if index > 0 && char == prev && (char != "e" && char != "o") {
        flag = true
      }
      
      prev = char
    }
    
    if !isVowelIncluded {
      flag = true
    }
    
    if flag {
      print("<\(str)> is not acceptable.")
    } else {
      print("<\(str)> is acceptable.")
    }
  }
}

main()

