func solution(_ arr:[Int]) -> [Int] {
  return arr.count > 1 ? arr.filter { $0 != arr.min() } : [-1]
}
