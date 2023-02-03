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
        
        while left <= right {
            let middleIndex = left + (right - left)/2
            if nums[middleIndex] == target {
                return middleIndex
            } else if nums[middleIndex] < target {
                left = middleIndex + 1
            } else {
                right = middleIndex - 1
            }
        }
        
        return left
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
    
    func test_searchInsert_shouldReturnOneTheExpectedIndexOnUnavailableTargetNumberInNums() {
        
        let sut = Solution()
        
        let result = sut.searchInsert([1,3,5,6], 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_searchInsert_shouldReturnFourTheExpectedIndexOnUnavailableTargetNumberInNums() {
        let sut = Solution()
        
        let result = sut.searchInsert([1,3,5,6], 7)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_searchInsert_shouldReturnZeroTheExpectedIndexOnUnavailableTargetNumberInNums() {
        let sut = Solution()
        
        let result = sut.searchInsert([1,3,5,6], 0)
        
        XCTAssertEqual(result, 0)
    }
}
