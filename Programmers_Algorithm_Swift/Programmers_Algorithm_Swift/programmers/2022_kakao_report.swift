//
//  2022_kakao_report.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/22.
//

import Foundation

class Report {
    func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var reportCount: [Int] = Array(repeating: 0, count: id_list.count)
        var dict: [String: [String]] = [:]
        var ids: [String: Int] = [:]
        
        for (index, id) in id_list.enumerated() {
            ids[id] = index
        }
        
        Set(report).forEach ({ arr in
            let newArr = arr.components(separatedBy: " ")
            dict[newArr[0]]?.append(newArr[1])
        })
        
        for id in dict.keys {
            if let name = dict[id] {
                if name.count >= k {
                    reportCount[ids[id]!] += 1
                }
            }
        }
        
        return reportCount
    }
    
    // 다른사람 풀이
    func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var reported: [String: Int] = [:]
        var user: [String: [String]] = [:]

        for r in Set(report) {
            let splited = r.split(separator: " ").map { String($0) }
            user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
            reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
        }

        return id_list.map { id in
            return (user[id] ?? []).reduce(0) {
                $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
            }
        }
    }
}
