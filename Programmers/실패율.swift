import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
  
  // reached = 도달 & clear
  var reached: [Int] = .init(repeating: 0, count: N+1)
  // notCleared = 해당 스테이지 not clear
  var notCleared: [Int] = .init(repeating: 0, count: N+1)
  
  var percentage: [Double] = .init(repeating: 0, count: N+1)
  
  // stage 는 1, 2, 3, 4... 까지 clear 하다가 'playerStage' 에 도달하지만 clear 는 못한 것이다.
  stages.forEach { (playerStage) in
    for stage in 1...playerStage {
      // 최종 stage인 'N' + 1 은 모두 클리어한 것이란 의미
      if stage == N + 1 { break }
      
      reached[stage] += 1
      
      if stage == playerStage { notCleared[stage] += 1 }
    }
  }

  for index in percentage.indices {
    // 인덱스 조작을 쉽게하려고 0은 비워두었다. index 와 stage 번호가 같다.
    if index == 0 { continue }
    
    // reached[index] == 0 이 참일 때 Nan 이 되므로 그에 대한 처리
    percentage[index] = (reached[index] == 0) ? Double(-1) : Double(notCleared[index]) / Double(reached[index])
  }

  return (1...N).sorted { percentage[$0] == percentage[$1] ? $0 < $1 : percentage[$0] > percentage[$1] }
}