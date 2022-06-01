import Foundation

func solution() {
    let size = Int(readLine()!)!
    
    var list = Array(repeating: 0, count: size + 1)
    list[1] = 1
    
    // index out of error 방지
    if size > 1 {
        list[2] = 3
    }
    
    func dp(_ size: Int) -> Int {
        // 저장되어 있다면 그 값을 반환한다.
        guard list[size] == 0 else { return list[size] }
        
        if size == 1 {
            return list[1]
        } else if size == 2 {
            return list[2]
        } else {
            list[size] = (dp(size-1) + (2*dp(size-2))) % 10007
            return list[size]
        }
    }
    
    print(dp(size))
}
solution()
