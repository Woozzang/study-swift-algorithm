func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    for i in (1...Int(sqrt(Double(yellow)))+1) {
        if yellow.isMultiple(of: i) {
            if (i + yellow/i) == ((brown - 4) / 2) {
                return [yellow/i + 2 , i + 2]
            }
        }
    }
    
    return []
}
