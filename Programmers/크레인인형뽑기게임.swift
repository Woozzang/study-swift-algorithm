import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
  var result = 0
  var stack: [Int] = .init()
  var board: [[Int]] = board
  
  moves.forEach { index in
    for listIndex in board.indices {
      if board[listIndex][index-1] != 0 {
        if stack.isEmpty {
          stack.append(board[listIndex][index-1])
          board[listIndex][index-1] = 0
          break
        }

        if stack.last! == board[listIndex][index-1] {
          stack.removeLast()
          board[listIndex][index-1] = 0
          result += 1
          break
        } else {
          stack.append(board[listIndex][index-1])
          board[listIndex][index-1] = 0
          break
        }
      } else { continue }
      
    }
  }
    return result * 2
}
