//
//  SearchOfASortedArrayTests.swift
//  SearchOfASortedArrayTests
//
//  Created by Klaudius Ivan Anteraja on 04/02/23.
//

import XCTest

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return []
    }
}

/**
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
 Example 1:

 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
*/
final class SearchOfASortedArrayTests: XCTestCase {

    func test_sortedSquares_shouldReturnEmptyArrayOnEmptyInputNums() {
        let sut = Solution()
        
        let result = sut.sortedSquares([])
        
        XCTAssertEqual(result, [])
    }
}
