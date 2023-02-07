//
//  TwoSumInputArrayIsSortedTests.swift
//  TwoSumInputArrayIsSortedTests
//
//  Created by Klaudius Ivan Anteraja on 07/02/23.
//

import XCTest

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left <= right {
            if numbers[left] + numbers[right] > target {
                right -= 1
            } else if numbers[left] + numbers[right] < target {
                left += 1
            } else {
                return [left + 1, right + 1]
            }
        }
        return []
       
    }
}


/**
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

 Your solution must use only constant extra space.

  

 Example 1:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 Example 2:

 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 Example 3:

 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
 */
final class TwoSumInputArrayIsSortedTests: XCTestCase {

    func test_twoSum_shouldReturnEmptyArrayWithEmptyInput() {
        let sut = Solution()
        
        let result = sut.twoSum([], 10)
        
        XCTAssertEqual(result, [])
    }
    
    func test_twoSum_shouldReturnIndex1AndIndex2WhenInputTwoNumbersArrayZeroAndNotZeroNumbers() {
        let sut = Solution()
        
        let result = sut.twoSum([-3,0], -3)
        
        XCTAssertEqual(result, [1,2])
    }
    
    func test_twoSum_shouldReturnIndex1AndIndex2WhenInputMoreThanTwoNumbersArray() {
        let sut = Solution()
        
        let result = sut.twoSum([2,7,11,15], 9)
        
        XCTAssertEqual(result, [1,2])
    }
}
