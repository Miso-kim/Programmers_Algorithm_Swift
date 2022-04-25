//
//  isPrime.swift
//  Programmers_Algorithm_Swift
//
//  Created by misoKim on 2022/04/25.
//

import Foundation

// 소수 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12977
class IsPrime {
    func solution(_ nums:[Int]) -> Int {
        var count = 0
        for i in nums.indices {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    if isPrime(nums[i]+nums[j]+nums[k]) {
                        count += 1
                    }
                }
            }
        }
        return count
    }

    func isPrime(_ n: Int) -> Bool {
        if n < 3 { return false}
        if n == 3 { return true }
        else {
            for i in 2 ..< n {
                if n%i == 0 { return false}
            }
        }
        return true
    }

    // 다른사람풀이 dfs

    func solution2(_ nums:[Int]) -> Int {
        var count = 0
        let list = Array(repeating: 0, count: nums.count)
        // data: 데이터 리스트, list: 뽑을 데이터의 idx 정보, r: 뽑을 갯수
        dfs(data: nums, list: list, r: 3, idx: 0, depth: 0, count: &count)
        
        return count
    }

    func dfs(data: [Int], list: [Int], r: Int, idx: Int, depth: Int, count: inout Int) {
        if r == 0 {
            var sum = 0
            for i in 0 ..< idx {
                sum += data[list[i]] // data[list[i]]가 뽑은 item
            }
            if isPrime(sum) {
                count += 1
            }
        } else if depth >= data.count { return }
        else {
            var list = list
            list[idx] = depth
            dfs(data: data, list: list, r: r-1, idx: idx+1, depth: depth+1, count: &count)
            dfs(data: data, list: list, r: r, idx: idx, depth: depth+1, count: &count)
        }
    }
}


