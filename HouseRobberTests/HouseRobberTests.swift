//
//  HouseRobberTests.swift
//  HouseRobberTests
//
//  Created by Klaudius Ivan Anteraja on 13/03/23.
//

import XCTest

/**
 This particular problem and most of others can be approached using the following sequence:

 Find recursive relation
 Recursive (top-down)
 Recursive + memo (top-down)
 Iterative + memo (bottom-up)
 Iterative + N variables (bottom-up)
 */
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var oddIndexResults: Int = 0
        var evenIndexResults: Int = 0
        
        (oddIndexResults, evenIndexResults) = nums.enumerated().reduce(into: (0, 0)) { partialResult, enumeratedValue in
            let temp = partialResult.0
            partialResult = (max(partialResult.1+enumeratedValue.element, partialResult.0), temp)
        }
        
        return max(oddIndexResults, evenIndexResults)
    }
}

/**
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

 Example 1:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 2:

 Input: nums = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
  

 Constraints:
 1 <= nums.length <= 100
 0 <= nums[i] <= 400
 */
final class HouseRobberTests: XCTestCase {
    func test_rob_shouldReturn0OnEmptyInput() {
        let sut = Solution()
        
        let result = sut.rob([])
        
        XCTAssertEqual(result, 0)
    }

    func test_rob_shouldReturn3On2AdjecentHouseWhichTheHighestResult() {
        let sut = Solution()
        
        let result = sut.rob([1,3])
        
        XCTAssertEqual(result, 3)
    }
    
    func test_rob_shouldReturnHighestResult() {
        let sut = Solution()
        
        let result = sut.rob([2,7,9,3,1])
        
        XCTAssertEqual(result, 12)
    }
}
