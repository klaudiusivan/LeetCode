//
//  SearchInsertPositionTests.swift
//  SearchInsertPositionTests
//
//  Created by Klaudius Ivan Anteraja on 03/02/23.
//

import XCTest

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return 0
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
}
