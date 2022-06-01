
import Foundation

func solution() {
    let number = Int(readLine()!)!
    
    guard number != 1  else {
        print("*")
        return
    }
    
    let fullCount = ((number * 2) - 1)
    let firstStarIndex = fullCount / 2
    
    
    (0...firstStarIndex).forEach {
        if $0 == firstStarIndex {
            print("*", terminator: "")
        }
        print(" ", terminator: "")
    }
    
    print("")
    
    (1..<number-1).forEach {

        for columnIndex in (0...firstStarIndex+$0) {
            if columnIndex == firstStarIndex - $0 {
                print("*",terminator: "")
            } else if columnIndex == firstStarIndex + $0 {
                print("*",terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
        print("")
    }
    
    
    (0..<fullCount).forEach { _ in
        print("*", terminator: "")
    }
    
}

solution()


