//
//  PermutationInStringTests.swift
//  PermutationInStringTests
//
//  Created by Klaudius Ivan Anteraja on 14/02/23.
//

import XCTest

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        return false
    }
}

/**
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.

 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false
 */
final class PermutationInStringTests: XCTestCase {

    func test_checkInclusion_shouldReturnFalseOnTwoEmptyInput() {
        let sut = Solution()
        
        let result = sut.checkInclusion("", "")
        
        XCTAssertFalse(result)
    }
}
