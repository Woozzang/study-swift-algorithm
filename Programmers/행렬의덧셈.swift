func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
  
  var answer: [[Int]] = .init()
    
  (0..<arr1.endIndex).forEach { rowIndex in
    var row: [Int] = .init()
    (0..<arr1[rowIndex].endIndex).forEach { elementIndex in
      row.append(arr1[rowIndex][elementIndex] + arr2[rowIndex][elementIndex])
    }
    answer.append(row)
  }
    
    return answer
}
