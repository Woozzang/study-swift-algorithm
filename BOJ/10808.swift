import Foundation

let str = String(readLine()!)

var dict: [Character: Int] = [:] 
    
"abcdefghijklmnopqrstuvwxyz".forEach {
    dict[$0] = 0
}

str.forEach {
    dict.updateValue((dict[$0] ?? 0) + 1, forKey: $0)
}

dict.sorted(by: <).forEach {
    print($0.value, terminator: " ")
}
