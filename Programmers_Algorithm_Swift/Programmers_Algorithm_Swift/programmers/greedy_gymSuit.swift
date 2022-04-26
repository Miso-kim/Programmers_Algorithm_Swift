//
//  greedy_gymSuit.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/26.
//

import Foundation

// 탐욕법 - 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Int](repeating: 1, count: n)
    lost.forEach { i in
        students[i - 1] -= 1
    }
    reserve.forEach { i in
        students[i - 1] += 1
    }
    
    for (index, num) in students.enumerated() {
        if num == 0 {
            switch index {
            case 0:
                if students[index + 1] == 2 {
                    students[index] += 1
                    students[index + 1] -= 1
                }
            case n-1:
                if students[index - 1] == 2 {
                    students[index] += 1
                    students[index - 1] -= 1
                }
            default:
                if students[index - 1] == 2 {
                    students[index] += 1
                    students[index - 1] -= 1
                } else if students[index + 1] == 2 {
                    students[index] += 1
                    students[index + 1] -= 1
                }
            }
        }
    }
    return students.filter({$0 != 0}).count
}


// 다른사람 풀이(오류 있음)
func solution2(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    let newReserve = reserve.filter { !lost.contains($0) }
    let newLost = lost.filter { !reserve.contains($0) }

    var lostPeople: Int = newLost.count

    newReserve.forEach {
        // 체육복을 빌려 준 후에는 newReserve 에서 삭제해주고 다시 체크 해야함
        // 7, [3,7], [2,4] 케이스 통과 못함
        let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
        if isLend && lostPeople > 0 {
            lostPeople -= 1
        }
    }

    return n - lostPeople
}
