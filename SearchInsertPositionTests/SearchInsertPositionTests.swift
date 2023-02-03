//
//  SearchInsertPositionTests.swift
//  SearchInsertPositionTests
//
//  Created by Klaudius Ivan Anteraja on 03/02/23.
//

import XCTest

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        var expectedIndex = 0
        while left < right {
            expectedIndex = (left+right) / 2
            if nums[expectedIndex] == target {
                return expectedIndex
            } else if nums[expectedIndex] > target {
                right = expectedIndex - 1
            } else {
                left = expectedIndex + 1
            }
        }
        
        return expectedIndex
    }
}

/**
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.
 */
final class SearchInsertPositionTests: XCTestCase {
    func test_searchInsert_shouldReturnZeroOnEmptyArrayWithTarget() {
        let sut = Solution()
        
        let result = sut.searchInsert([], 4)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_searchInsert_shouldReturnTwoOnExistTargetNumberInNums() {
        let sut = Solution()
        
        let result = sut.searchInsert([1,3,5,6], 5)
        
        XCTAssertEqual(result, 2)
    }
}
