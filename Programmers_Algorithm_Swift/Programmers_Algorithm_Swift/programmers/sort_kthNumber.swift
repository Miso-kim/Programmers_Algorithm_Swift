//
//  sort_kthNumber.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/03/17.
//

import Foundation

class sort_kthNumber {
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        var answer: [Int] = []
        commands.forEach {
            answer.append(array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1])
        }
        return answer
    }
    
    // 다른사람 풀이
    func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        return commands.map {
            let i = $0[0]-1
            let j = $0[1]-1
            let k = $0[2]-1
            return array[i...j].sorted()[k]
        }
    }
}
