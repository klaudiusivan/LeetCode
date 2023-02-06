//
//  MoveZeroesTests.swift
//  MoveZeroesTests
//
//  Created by Klaudius Ivan Anteraja on 06/02/23.
//

import XCTest

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            if nums[left] == 0 {
                let temp = nums[left]
                nums.remove(at: left)
                nums.insert(temp, at: right)
                right -= 1
            } else {
                left += 1
            }
        }
    }
}

/**
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.
 
 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]

 */
final class MoveZeroesTests: XCTestCase {

    func test_moveZeroes_shouldResultsEmptyArrayWithEmptyInput() {
        let sut = Solution()
        
        var results: [Int] = []
        
        sut.moveZeroes(&results)
        
        XCTAssertEqual(results, [])
    }
    
    func test_moveZeroes_shouldKeepTheSameArrayWithOneZeroInputs() {
        let sut = Solution()
        
        var results: [Int] = [0]
        
        sut.moveZeroes(&results)
        
        XCTAssertEqual(results, [0])
    }
    
    func test_moveZeroes_shouldMoveZeroToTheBackAndKeepTheNumberOrder() {
        let sut = Solution()
        
        var results: [Int] = [0,1,0,3,12]
        
        sut.moveZeroes(&results)
        
        XCTAssertEqual(results, [1,3,12,0,0])
    }

}
