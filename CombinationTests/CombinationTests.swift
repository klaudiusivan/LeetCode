//
//  CombinationTests.swift
//  CombinationTests
//
//  Created by Klaudius Ivan Anteraja on 06/03/23.
//

import XCTest

class Solution {
    var answer: [[Int]] = []
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var current: [Int] = []
        
        combine(index: 1, k: k, current: &current, n: n)
        
        return answer
    }
    
    func combine(index: Int, k: Int, current: inout [Int], n: Int) {
        
        if current.count == k {
            answer.append(current)
            return
        }
        for i in index..<(n+1) {
            current.append(i)
            combine(index: i+1, k: k, current: &current, n: n)
            current.removeLast()
        }
    }
}

/**
 Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].

 You may return the answer in any order.

 Example 1:

 Input: n = 4, k = 2
 Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
 Explanation: There are 4 choose 2 = 6 total combinations.
 Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.
 Example 2:

 Input: n = 1, k = 1
 Output: [[1]]
 Explanation: There is 1 choose 1 = 1 total combination.
 
 1 <= n <= 20
 1 <= k <= n
 */
final class CombinationTests: XCTestCase {
    func test_combine_shouldReturnEmptyArrayWhenInputZeroK() {
        let sut = Solution()
        
        let result = sut.combine(5, 0)
        
        XCTAssertEqual(result, [[]])
    }
    
    func test_combine_shouldReturnOneArrayNumberWhenInputOneKAndOneN() {
        let sut = Solution()
        
        let result = sut.combine(1, 1)
        
        XCTAssertEqual(result, [[1]])
    }
    
    func test_combine_shouldReturnCombinationOfGivenNandK() {
        let sut = Solution()
        
        let result = sut.combine(4, 2)
        
        XCTAssertEqual(result, [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]])
    }
}
