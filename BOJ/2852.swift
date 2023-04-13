import Foundation

let count = Int(readLine()!)!
var aScore = 0
var bScore = 0
var aTime = 0
var bTime = 0
var prev = [String]()

for _ in (1...count) {
  let inputs = readLine()!.split(separator: " ")
  
  let scoreTeam = inputs[0]
  let time = inputs[1].split(separator:":").map { String($0) }
  
  if aScore > bScore {
    
    aTime +=  seconds(time) - seconds(prev)
    
  } else if bScore > aScore {
    
    bTime +=  seconds(time) - seconds(prev)
  }
  
  if scoreTeam == "1" {
    aScore += 1
  } else {
    bScore += 1
  }
  
  prev = time
}

if aScore > bScore {
  
  aTime +=  seconds(["48","00"]) - seconds(prev)
  
} else if bScore > aScore {
  
  bTime +=  seconds(["48","00"]) - seconds(prev)
}

timeToString(aTime)
timeToString(bTime)

func seconds(_ value: [String]) -> Int {
  return (Int(value[0])! * 60) + Int(value[1])!
}

func timeToString(_ time: Int) {
  let aHour = "\(time / 60)"
  let aMin = "\(time % 60)"

  if aHour.count == 1 {
    print("0",aHour,":",separator:"", terminator: "")
  } else {
    print(aHour,":",separator:"",terminator: "")
  }

  if aMin.count == 1 {
    print("0",aMin,separator:"")
  } else {
    print(aMin,separator:"")
  }
}

