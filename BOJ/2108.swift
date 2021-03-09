import Foundation

let count = Int(readLine()!)!

var sum = 0, min = 0, max = 0

//MARK: 초기화 및 최대, 최소값 계산
var list = { () -> [Int] in
  var list = [Int]()
  
  let num = Int(readLine()!)!
  sum += num
  min = num; max = num
  list.append(num)
  
  for _ in 0..<count-1 {
    let num = Int(readLine()!)!
    sum += num
    
    if num > max { max = num }
    if num < min { min = num }
    
    list.append(num)
  }
    return list
}()

//MARK: 산술평균
var val = round((Float(sum) / Float(list.count)))
print(Int(val))

//MARK: 중앙값
list.sort()
if list.count == 1{
  print(list.first!)
} else {
  let mediumIndex = (list.count-1) / 2
  print(list[mediumIndex])
}


//MARK: 최빈값
// 0 ~ 8000 까지의 배열을 생성
var freqList = {()->[Int] in
  let list = [Int](repeating: 0, count: 8001)
  return list
}()

//인덱스를 +4000 으로 계산해 빈도 수 저장
list.forEach { freqList[$0+4000] += 1 }

var freqMax = -1
var conditionalList = [Int]()

for i in freqList.indices {
  let num = freqList[i]
  if freqMax < num {
    freqMax = num
    conditionalList.removeAll()
    conditionalList.append(i-4000)
  } else if freqMax == num {
    conditionalList.append(i-4000)
  }
}

if conditionalList.count == 1 {
  print(conditionalList.first!)
} else {
  conditionalList.sort()
  print(conditionalList[1])
}

//MARK: 범위
let range = max - min

print(range)