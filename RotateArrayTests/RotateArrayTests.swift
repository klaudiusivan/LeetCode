//
//  RotateArrayTests.swift
//  RotateArrayTests
//
//  Created by Klaudius Ivan Anteraja on 05/02/23.
//

import XCTest

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
    
    }
}

/**
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 */
final class RotateArrayTests: XCTestCase {
    
    func test_rotate_shouldResultEmptyArrayOnEmptyNumsWithTenK() {
        let sut = Solution()
        var results: [Int] = []
        
        sut.rotate(&results, 10)
        
        XCTAssertEqual(results, [])
    }
}
