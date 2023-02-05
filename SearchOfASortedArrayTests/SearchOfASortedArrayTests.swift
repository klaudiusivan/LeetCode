//
//  SearchOfASortedArrayTests.swift
//  SearchOfASortedArrayTests
//
//  Created by Klaudius Ivan Anteraja on 04/02/23.
//

import XCTest

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var left = 0
        var right = nums.count - 1
        var currentIndex = nums.count - 1
        var squareResults = [Int].init(repeating: 0, count: n)
        
        while left <= right {
            if abs(nums[left]) > abs(nums[right]) {
                squareResults[currentIndex] = nums[left] * nums[left]
                left += 1
            } else {
                squareResults[currentIndex] = nums[right] * nums[right]
                right -= 1
            }
            
            currentIndex -= 1
        }
        
        return squareResults
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
    
    func test_sortedSquares_shouldReturnOneNumberResultForOneInputNums() {
        let sut = Solution()
        
        let result = sut.sortedSquares([1])
        
        XCTAssertEqual(result, [1])
    }
    
    func test_sortedSquares_shouldReturnSortedSquareNumbers() {
        let sut = Solution()
        
        let result = sut.sortedSquares([-4,-1,0,3,10])
        
        XCTAssertEqual(result, [0,1,9,16,100])
    }
}
