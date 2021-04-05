import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let firstWay = [1,2,3,4,5]
    let secondWay = [2,1,2,3,2,4,2,5]
    let thirdWay = [3,3,1,1,2,2,4,4,5,5]
    
    var scoreDict = [1 : 0, 2: 0, 3: 0]
    
    for index in answers.indices {
        
        let answer = answers[index]
        
        if answer == firstWay[index % firstWay.count] {
            scoreDict[1] = scoreDict[1]! + 1
        }
        if answer ==  secondWay[index % secondWay.count] {
            scoreDict[2] = scoreDict[2]! + 1
        }
        if answer == thirdWay[index % thirdWay.count] {
            scoreDict[3] = scoreDict[3]! + 1
        }
    }
    
    var sortedList = scoreDict.sorted { return $0.value > $1.value }
    
    let base = sortedList.first!.value
    var answerList: [Int] = []
    
    for answer in sortedList {
        
        if answer.value == base {
            answerList.append(answer.key)
        } else {
            break
        }
    } 
    
    return answerList.sorted(by: <)
}