import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    
    let a = A.sorted()
    let b = B.sorted{ $0 > $1 }
    
    zip(a,b).forEach {
        ans += $0 * $1
    }

    return ans
}
