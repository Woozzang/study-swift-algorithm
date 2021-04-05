import Foundation

func solution(_ new_id:String) -> String {
    
    //1
    var new_id:[Character] = .init(new_id.lowercased())
    
    //2
    let availableCharacters: [Character] = ["a","z","1","9","-","_","."]
    let engCharacterLowerBound:Int = Int(availableCharacters[0].asciiValue!)
    let engCharacterUpperBound:Int = Int(availableCharacters[1].asciiValue!)
    
    let numCharacterLowerBound:Int = Int(availableCharacters[2].asciiValue!)
    let numCharacterUpperBound:Int = Int(availableCharacters[3].asciiValue!)
    
    
    new_id = new_id.filter { ((engCharacterLowerBound <= Int($0.asciiValue!)) && ( Int($0.asciiValue!) <= engCharacterUpperBound)) || (numCharacterLowerBound <= Int($0.asciiValue!)) && (Int($0.asciiValue!) <= numCharacterUpperBound) || (availableCharacters[4...].contains($0)) }
    
    //3
    var tmp_id: [Character] = []
    
    for (index, character) in new_id.enumerated() {
        if index == 0 {
            tmp_id.append(character)
            continue
        }
        if character == "." {
            if new_id[new_id.index(before: index)] == "." { continue }
            tmp_id.append(character)
            continue
        } else {
            tmp_id.append(character)
        }
    }
    new_id = tmp_id
    
    //4

    while !new_id.isEmpty && (new_id.first! == "." || new_id.last! == ".") {
        if (new_id.first! == ".") { new_id.removeFirst() }
        if (!new_id.isEmpty) && (new_id.last! == ".") { new_id.removeLast() }
    }
    
    //5
    if new_id.isEmpty {
        return "aaa"
    }
    
    //6
    if new_id.count > 15 {
        new_id = [Character](new_id[...14])
        if new_id.last! == "." { new_id.removeLast() }
    }
    
    //7
    if new_id.count <= 2 {
        // let last = new_id.last!
        while new_id.count < 3 {
            new_id.append(new_id.last!)
        }
    }

    return String(new_id)
}

