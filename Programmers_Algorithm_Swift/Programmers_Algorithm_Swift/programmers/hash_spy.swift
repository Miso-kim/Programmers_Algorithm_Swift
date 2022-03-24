//
//  hash_spy.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/03/23.
//

import Foundation
class Spy {
    func solution(_ clothes:[[String]]) -> Int {
        var clothesDict : [String: Int] = [:]
        for cloth in clothes {
            let key = cloth[1]
            if !clothesDict.keys.contains(key) {
                clothesDict[key] = 0
            }
            clothesDict[key]? += 1
        }
        
        var count = 1
        for num in clothesDict.values {
            count *= (num + 1)
        }
        return count-1
    }

    func solution2(_ clothes:[[String]]) -> Int {
        let types = clothes.compactMap({ $0.last })
        let typeSet = Set(types)
        let categories = Array(typeSet)
        let counts = categories.map({ category in
            return clothes.filter({ $0.last == category }).count + 1 })
        return counts.reduce(1, { $0 * $1 }) - 1
    }
    
    func solution3(_ clothes:[[String]]) -> Int {
        let counts = Set(clothes.compactMap({ $0.last })).map({ category in
            return clothes.filter({ $0.last == category }).count + 1
        })
        
        return counts.reduce(1, {$0 * $1}) - 1
    }
}
