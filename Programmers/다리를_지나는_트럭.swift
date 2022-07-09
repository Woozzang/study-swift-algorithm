import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var sec = 0
    var trucks = truck_weights
    let weight = weight
    var bridgeWeight = 0
    
    while bridge.isEmpty == false {
        
        bridgeWeight -= bridge.removeFirst()
        
        if !trucks.isEmpty {
            
            if trucks.first! + bridgeWeight <= weight {
                
                let truck = trucks.removeFirst()
                
                bridge.append(truck)
                
                bridgeWeight += truck
                
            } else {
                bridge.append(0)
            }
        } 
        
        sec += 1
    }
    
    
    return sec
}

