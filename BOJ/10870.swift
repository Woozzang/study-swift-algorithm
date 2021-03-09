import Foundation

let turn = Int(readLine()!)!

var twoStepBefore = 0, oneStepBefore = 1
var answer = -1

let cnt = turn-1
if turn == 0 {
    print(0); exit(0)
} else if turn == 1 {
    print(1); exit(0)
}

for _ in 0..<cnt {
    answer = twoStepBefore + oneStepBefore
    twoStepBefore = oneStepBefore
    oneStepBefore = answer
}

print(answer)
