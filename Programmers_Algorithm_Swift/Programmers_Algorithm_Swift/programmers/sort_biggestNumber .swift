//
//  sort_biggestNumber .swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/03/17.
//

import Foundation

class sort_biggestNumber {
    func solution(_ numbers:[Int]) -> String {
        var str = numbers.map { String($0)}
        str.sort {
            return $0+$1 > $1+$0
        }
        
        let answer = str.joined()
        if let num = Int(answer) { return String(num) }
        
        return answer
    }
    
    // 다른사람 풀이
    func solution2(_ numbers:[Int]) -> String {
        var newNumbers = numbers.sorted(by: { Int("\($0)\($1)")! - Int("\($1)\($0)")! > 0 })
        if newNumbers[0] == 0{
            return "0"
        }
        return newNumbers.map({ String($0) }).joined()
    }
    
    // 다른사람 풀이
    func solution3(_ numbers: [Int]) -> String {
        let sortedNumbers = numbers.sorted {
            Int("\($0)\($1)")! > Int("\($1)\($0)")!
        }
        
        let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
        return sortedNumbers.first == 0 ? "0" : answer
    }
}
