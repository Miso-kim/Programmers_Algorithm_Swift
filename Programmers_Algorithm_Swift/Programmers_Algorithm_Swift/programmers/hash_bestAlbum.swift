//
//  hash_bestAlbum.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/04.
//

import Foundation

class BestAlbum {
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var playsByGenre: [String:Int] = [:]
        var idsByGenre: [String:[Int]] = [:]
        
        for i in 0..<genres.count {
            let genre = genres[i]
            let play = plays[i]
            
            if let pCount = playsByGenre[genre] {
                playsByGenre[genre] = pCount + play
            } else {
                playsByGenre[genre] = play
            }
            
            if !idsByGenre[genre]!.isEmpty {
                idsByGenre[genre]?.append(i)
            } else {
                idsByGenre[genre]  = [i]
            }
        }

        let bestGenre: [String] = Array(playsByGenre.keys).sorted{
            return playsByGenre[$0]! > playsByGenre[$1]!
        }

        var answer: [Int] = []
        for genre in bestGenre {
            let IDs = idsByGenre[genre]!.sorted{
                return plays[$0] > plays[$1]
            }
            answer.append(IDs[0])
            if IDs.count > 1 {
                answer.append(IDs[1])
            }
        }
        return answer
    }
    
    func solution2(_ genres:[String], _ plays:[Int]) -> [Int] {
        var genreDict:[String:Int] = [:]
        var genrePlays:[(String, Int, Int)] = []
        
        for (index, (genre, play)) in zip(genres, plays).enumerated() {
            let count = genreDict[genre] ?? 0
            genreDict[genre] = count + play
            genrePlays.append((genre, play, index))
        }
        
        genrePlays.sort(by: { $0.1 > $1.1 })
        let sortedGenres = genreDict.sorted(by: { $0.value > $1.value })
        var bestAlbum:[Int] = []
        
        for sortedGenre in sortedGenres {
            let songs = genrePlays.filter({ $0.0 == sortedGenre.key }).prefix(2).map({ $0.2 })
            bestAlbum.append(contentsOf: songs)
        }
        return bestAlbum
    }
}
