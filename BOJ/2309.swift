import Foundation

var people: [Int] = []

(1...9).forEach { _ in 
    let h = Int(readLine()!)!
    people.append(h)
}

let n = 9
let r = 7
var didFind = false

func combi(_ start: Int,_ arr: inout [Int]) {
    
    if didFind {
        return 
    }
    
    if arr.count == r {
        
        let selected = arr.map { people[$0] }
        
        if selected.reduce(0, +) == 100 {
            selected.sorted(by: <).forEach {
                print($0)
            }
            didFind = true
        }
        return 
    }
    
    for i in start+1 ..< n {
        arr.append(i)
        combi(i, &arr)
        arr.popLast()
    }
    
}

var a = [Int]()

combi(-1, &a)


