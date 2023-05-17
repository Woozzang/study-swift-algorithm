///https://school.programmers.co.kr/learn/courses/30/lessons/77485

import Foundation

/*
 1. rows x colums 배열 만들기
 2. queries 순회하기
 3. 한개의 query 해석하기
  - 테두리만 돌기
  - x1 -> x2, y1 -> y2, x2 -> x1, y2 -> y1
 */
 
var rst = [Int]()

 func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
  
   var value = 1
   
   var rect = [[Int]]()
   
   for row in (1...rows) {
     var arr = [Int]()
     for column in (0..<columns) {
       arr.append(value)
       value += 1
     }
     rect.append(arr)
   }
   
   for query in queries {
     
     let y1 = query[0]-1
     let x1 = query[1]-1
     let y2 = query[2]-1
     let x2 = query[3]-1
     
     var arr = [Int]()
     
      /// 시계방향으로 돌면서 값 가져오기~
     for x in (x1...x2-1) {
       arr.append(rect[y1][x])
     }
     
     for y in (y1...y2-1) {
       arr.append(rect[y][x2])
     }
     
     for x in (x1+1...x2).reversed() {
       arr.append(rect[y2][x])
     }
     
     for y in (y1+1...y2).reversed() {
       arr.append(rect[y][x1])
     }
     
     rst.append(arr.min()!)
     
		 /// 시계방향으로 돌면서 값 넣기~
     var index = arr.count - 1
     let rotate = arr.count
     
     for x in (x1...x2-1) {
       rect[y1][x] = arr[index % rotate]
       index += 1
     }
     
     for y in (y1...y2-1) {
       rect[y][x2] = arr[index % rotate]
       index += 1
     }
     
     for x in (x1+1...x2).reversed() {
       rect[y2][x] = arr[index % rotate]
       index += 1
     }
     
     for y in (y1+1...y2).reversed() {
       rect[y][x1] = arr[index % rotate]
       index += 1
     }
   }
   
  return rst
}

print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
