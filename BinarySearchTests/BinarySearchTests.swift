//
//  BinarySearchTests.swift
//  BinarySearchTests
//
//  Created by Klaudius Ivan Anteraja on 01/02/23.
//

import XCTest

class Solution {
    // MARK: - Recursive
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(array: nums, start: 0, end: nums.count - 1, target: target)
    }
    
    private func binarySearch(array: [Int], start: Int, end: Int, target: Int) -> Int {
        if start > end { return -1 }
        
        let middleIndex = Int((start + end) / 2)
        
        if array[middleIndex] == target {
            return middleIndex
        }
        else if array[middleIndex] > target {
            return binarySearch(array: array, start: start, end: middleIndex - 1, target: target)
        }
        else {
            return binarySearch(array: array, start: middleIndex + 1, end: end, target: target)
        }
    }
    
    // MARK: - Iteration
    func searchWithIteration(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
           let middle = Int((left+right)/2)
            
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return -1
    }
}

/**
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.
 */
final class BinarySearchTests: XCTestCase {
    
    func test_search_shouldReturnMinusOneOnEmptyNums() {
        let sut = Solution()
        
        let result = sut.search([], 5)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_search_shoulReturnMinusOneOnWrongTarget() {
        let sut = Solution()
        
        let result = sut.search([-4,0,2,4], 5)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_search_bigArrayShoulReturnMinusOneOnWrongTarget() {
        let sut = Solution()
        
        let result = sut.search([-1,0,3,5,9,12], 2)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_search_shouldReturnZeroWithOneArrayAndRightTarget() {
        let sut = Solution()
        
        let result = sut.search([5], 5)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_search_shoulReturnRightIndexWithRightTarget() {
        let sut = Solution()
        
        let result = sut.search([-1,0,3,5,9,12], 9)
        
        XCTAssertEqual(result, 4)
    }

}
