//
//  innerMultiplication .swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/25.
//

import Foundation

// 내적
// https://programmers.co.kr/learn/courses/30/lessons/70128

class InnerMultiplication {
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        return zip(a,b).compactMap({$0 * $1}).reduce(0, {$0 + $1})
    }

    // 다른사람풀이
    func solution2(_ a:[Int], _ b:[Int]) -> Int {
        return zip(a, b).map(*).reduce(0, +)
    }
}
