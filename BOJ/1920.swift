//func binarySearch(target: Int, list: [Int]) -> Int {
//  let midIndex = list.count / 2
//
//  guard list.count >= 1 else {
//    return 0
//  }
//
//  if target == list[midIndex] {
//    return 1
//  }
//
//  guard midIndex != 0 else {
//    return 0
//  }
//
//  if target < list[midIndex] {
//    return binarySearch(target: target, list: Array(list[..<midIndex]))
//  } else {
//    return binarySearch(target: target, list: Array(list[midIndex+1..<list.count]))
//  }
//}

//print(binarySearch(target: 4, list: [1,2,3,4,5,6,7,8,9,10]))

func binarySearch(target: Int, list: [Int]) -> Int {
  var left = 0
  var right = list.count - 1

  while left <= right {

    let mid = (right + left) / 2

    if list[mid] == target {
      return 1
    }

    if target < list[mid] {
      right = mid - 1
      continue
    } else {
      left = mid + 1
      continue
    }
  }
 return 0
}

func solution() {
  var _ = readLine()!
  let givenList = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

  var _ = readLine()!
  let givenNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }

  givenNumbers.forEach {
    if $0 < givenList.first! || $0 > givenList.last! {
      print(0); return
    }
    print(binarySearch(target: $0, list: givenList))
  }
}

solution()
