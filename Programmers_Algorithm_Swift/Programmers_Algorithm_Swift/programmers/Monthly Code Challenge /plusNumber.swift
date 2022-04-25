//
//  plusNumber.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/25.
//

import Foundation


// 음양 더하기
// https://programmers.co.kr/learn/courses/30/lessons/76501

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(absolutes, signs).map({$1 == true ? $0 : -($0)}).reduce(0, +)
}

// 없는 숫자 더하기
// https://programmers.co.kr/learn/courses/30/lessons/86051
func solution(_ numbers:[Int]) -> Int {
    return (0...9).filter{!numbers.contains($0)}.reduce(0, +)
}
