//
//  TriangleTests.swift
//  TriangleTests
//
//  Created by Klaudius Ivan Anteraja on 18/03/23.
//

import XCTest

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var minimumLength: [Int] = triangle.last!
        
        for layer in stride(from: n-2, through: 0, by: -1) {
            
            for i in 0..<triangle[layer].count {
                minimumLength[i] = min(minimumLength[i], minimumLength[i+1]) + triangle[layer][i]
            }
            
        }
        return minimumLength[0]
    }
}

/**
 Given a triangle array, return the minimum path sum from top to bottom.

 For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

 Example 1:

 Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 Output: 11
 Explanation: The triangle looks like:
    2
   3 4
  6 5 7
 4 1 8 3
 The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
 Example 2:

 Input: triangle = [[-10]]
 Output: -10

 Constraints:

 1 <= triangle.length <= 200
 triangle[0].length == 1
 triangle[i].length == triangle[i - 1].length + 1
 -104 <= triangle[i][j] <= 104
 */
final class TriangleTests: XCTestCase {
    func test_minimumTotal_shouldReturnTheOnlyNumberOnInputArrayWhenLength1Triangle() {
        let sut = Solution()
        
        let result = sut.minimumTotal([[1]])
        
        XCTAssertEqual(result, 1)
    }
    
    func test_minimumTotal_shouldReturn11OnGivenTriangleArray() {
        let sut = Solution()
        
        let result = sut.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
        
        XCTAssertEqual(result, 11)
    }
}
