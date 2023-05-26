///https://school.programmers.co.kr/learn/courses/30/lessons/155651
import Foundation

func solution(_ book_times:[[String]]) -> Int {
  
  let book_times = book_times.map { time -> (Int, Int) in
    let start = time[0].split(separator: ":").compactMap { Int($0) }
    let end = time[1].split(separator: ":").compactMap { Int($0) }
    
    return ((start[0]*60 + start[1]), (end[0]*60 + end[1]))
  }
  
  var cnt = Array(repeating: 0, count: 60*24)
  
  for book_time in book_times {
    for time in (book_time.0 ..< (book_time.1+10)) {
      guard time < cnt.count else { break }
      cnt[time] += 1
    }
  }
  
  print(book_times)
  
  return cnt.max() ?? book_times.count
}


