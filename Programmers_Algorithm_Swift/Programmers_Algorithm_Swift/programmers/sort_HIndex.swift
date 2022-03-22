//
//  sort_HIndex.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/03/18.
//

import Foundation

class HIndex {
    func solution(_ citations:[Int]) -> Int {
        let newArray = citations.sorted {$0 > $1}
        for (index, num) in newArray.enumerated() {
            if index + 1 > num {
                return index
            }
        }
        return newArray.count
    }
}
