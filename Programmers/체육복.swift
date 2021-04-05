import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var realLost = Set(lost).subtracting(reserve).sorted(by: <)
    var realReserve = Set(reserve).subtracting(lost).sorted(by: <)
    
    for reserveStudent in realReserve {
        
        for (index, lostStudent) in realLost.enumerated() {
            
            if reserveStudent-1 == lostStudent || reserveStudent+1 == lostStudent {
                realLost.remove(at: realLost.firstIndex(of: lostStudent)!)
                break
            }
        }
    }
    
    
    return n - realLost.count
}
