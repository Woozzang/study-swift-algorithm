import Foundation

_ = readLine()

let nodes = readLine()!.split(separator: " ").compactMap { Int($0) }

var adj = Array(repeating: [Int](), count: 55)

// 자식 노드 추가하기
nodes.enumerated().forEach { nodeNumber, parentNodeNumber in
  
  if parentNodeNumber == -1 { return }
  
  var nodes = adj[parentNodeNumber]
    
  nodes.append(nodeNumber)
  
  adj[parentNodeNumber] = nodes
}

let deleteNode = Int(readLine()!)!

var queue = [Int]()
var rst = 0

// 루트부터 순회
queue.append(nodes.firstIndex(of: -1)!)

while !queue.isEmpty {
  
  let first = queue.removeFirst()
  
  if first == deleteNode { continue }
  
  let nodes = adj[first]
  
  if nodes.isEmpty || nodes.filter({ $0 != deleteNode }).isEmpty {
    rst += 1
    continue
  } else {
    nodes.forEach {
      queue.append($0)
    }
  }
}

print(rst)
