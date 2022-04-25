//
//  2021 Dev-Matching_lotto.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/22.
//

import Foundation

class Lotto {
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        let zeroNum = lottos.filter({$0 == 0}).count
        let lottoNum = lottos.filter{win_nums.contains($0)}.count

        let worst = lottoNum == 0 ? 6 : (6 - lottoNum + 1)
        let best = zeroNum + lottoNum == 0 ? 6 : 7 - (zeroNum + lottoNum)
        return [best, worst]
    }
    
    func solution2(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

        let zeroCount = lottos.filter { $0 == 0}.count
        let winCount: Int = win_nums.filter { lottos.contains($0) }.count

        return [min(7-winCount-zeroCount,6), min(7-winCount,6)]
    }
}
