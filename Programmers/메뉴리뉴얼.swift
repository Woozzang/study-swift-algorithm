/// https://school.programmers.co.kr/learn/courses/30/lessons/72411?language=swift

/**
 이전에 각 손님들이 주문할 때 가장 많이 함께 주문한 단품메뉴들을 코스요리 메뉴로 구성
 단, 코스요리 메뉴는 최소 2가지 이상의 단품메뉴로 구성
 최소 2명 이상의 손님으로부터 주문된 단품메뉴 조합에 대해서만 코스요리 메뉴 후보에 포함
 */


import Foundation

var _pickCount = 0
var list: [Character] = []
var _orders: [String] = []
var dict: [[Character]: Int] = [:]

func solution(_ orders:[String], _ course:[Int]) -> [String] {
  
  _orders = orders
  
  /// orders 를 순회, (문제 조건에 2개 이상 주문한다고 적혀있기 때문에 where 절은 필요 없긴함)
  for order in orders where order.count >= 2{
    
    // 만약 order.count 가 5 이고
    // course 가 [2, 3, 4] 라면, 이번 손님의 메뉴에서 5C2, 5C3, 5C4 구하기
    for pickCount in course {
      _pickCount = pickCount
      
      list = order.map(Character.init)
      
      comb(0, [])
    }
  }
  
  /// 메뉴조합의 길이순서로 정렬
  let arr = dict.sorted { lhs, rhs in
    lhs.key.count < rhs.key.count
  }
  
  var rst = [String]()
  
  /// 메뉴 길이 순서로 순회
  for course in course {
    
    let arr = arr.filter { $0.key.count == course }
    
    var maxValue = 0
    
    /// 같은 메뉴길이에서 최다 중복 회수 구하기
    arr.forEach {
      maxValue = max($0.value, maxValue)
    }
    
    /// 최다 중복 회수를 가지는 메뉴만 rst 배열에 넣기
    rst.append(contentsOf: arr.filter { $0.value == maxValue }.map { String($0.key) })
  }
  
  /// 문자열 소팅
  return rst.sorted(by: <)
}

func comb(_ start: Int, _ arr: [Int]) {
  
  if _pickCount == arr.count {

    /// _pickCount 만큼 뽑았음
    let picks = arr.map{list[$0]}
    
    var count = 0
    
    /// 뽑은조합이 `orders` 에서 몇개 중복되는지 `count` 에 저장하기
    A: for order in _orders {

      let order = order.map(Character.init)
      
      for pick in picks {
        if !order.contains(pick) {
          /// labele identifer 활용
          continue A
        }
      }
      
      count += 1
    }
    
    if count >= 2 {
      let key = picks.sorted(by: <)
      dict.updateValue(count, forKey: key)
    }
    
    return
  }
  
  for start in (start..<list.count) {
    comb(start+1, arr+[start])
  }
}
