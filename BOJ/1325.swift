import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

func bfs(_ here: Int) -> Int {
  
  var visited = Array(repeating: 0, count: N+1)

  var queue = [here]
  
  var idx = 0
  
  visited[here] = 1
  
  while idx < queue.count {
    let here = queue[idx]

    for there in graph[here] {
      if visited[there] == 0 {
        visited[there] = 1
        queue.append(there)
      }
    }
    idx += 1
  }
  
  return idx
}


let fio = FileIO()

let N = fio.readInt()
let M = fio.readInt()

var graph = Array(repeating: [Int](), count: N+1)

for _ in (1...M) {
  
  let child = fio.readInt()

  let node = fio.readInt()

  graph[node].append(child)
}

var totlaMax = 0

var output = [String]()

for i in (1...N) {
  
  let tmpMax = bfs(i)

  if totlaMax < tmpMax {
    totlaMax = tmpMax
    output = ["\(i)"]
  } else if totlaMax == tmpMax {
    output.append("\(i)")
  }
}

print(output.joined(separator: " "))
