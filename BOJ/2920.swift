func main () {
  let notes: [Int] = (readLine()?.split(separator: " ").map {Int(String($0))!})!

  if notes.first! == 1 {
      for (index, note) in notes.enumerated() {
          if note != index + 1 {
           print("mixed")
            return
          }
      }
      print("ascending")
  } else if notes.first! == 8 {
      for (index, note) in notes.reversed().enumerated() {
          if note != index + 1 {
            print("mixed")
            return
          }
      }
      print("descending")
  } else {
      print("mixed")
  }
}

main()