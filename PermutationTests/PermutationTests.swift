//
//  PermutationTests.swift
//  PermutationTests
//
//  Created by Klaudius Ivan Anteraja on 10/03/23.
//

import XCTest

class Solution {
    func permute(_ nums: [Int]) -> Set<[Int]> {
        var result: Set<[Int]> = []
        var nums: [Int] = nums
        permuteWith(&nums, begin: 0, result: &result)
        return result
    }
    
    // permute num[begin..end]
    // invariant: num[0..begin-1] have been fixed/permuted
    private func permuteWith(_ nums: inout [Int], begin: Int, result: inout Set<[Int]>){
        if begin >= nums.count {
            result.insert(nums)
        } else {
            for i in 0..<nums.count {
                nums.swapAt(begin, i)
                permuteWith(&nums, begin: begin + 1, result: &result)
                nums.swapAt(begin, i)
            }
        }
    }
}

/**
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */
final class PermutationTests: XCTestCase {

    func test_permute_shouldReturnOneValueOnNumsLengthIsOne() {
        let sut = Solution()
        
        let result = sut.permute([1])
        
        XCTAssertEqual(result,[[1]])
    }
    
    func test_permute_shouldReturnExpectedResult() {
        let sut = Solution()
        
        let result = sut.permute([1,2,3])
        
        XCTAssertEqual(result,[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]])
    }
}
