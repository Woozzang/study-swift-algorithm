import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreList: [String: Int] = .init()
    
    var zipList: [(inedx: Int, genres: String, plays:  Int)] = .init()
    
    for (index, (genre, play)) in zip(genres, plays).enumerated() {
        let count = genreList[genre] ?? 0
        genreList[genre] = count + play
        
        zipList.append((index, genre, play))
        
    }
    
    zipList.sort(by: { $0.2 > $1.2} )
    
    let sortedGenres = genreList.sorted(by: { $0.value > $1.value })
    
    var bestAlbum = [Int]()
    
    sortedGenres.forEach { sortedGenre in
        let songs = zipList.filter { $0.1 == sortedGenre.key }.prefix(2).map { $0.0 }
        bestAlbum.append(contentsOf: songs)
    }
    
    
    
    return bestAlbum
}
