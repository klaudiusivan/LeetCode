//
//  PermutationInStringTests.swift
//  PermutationInStringTests
//
//  Created by Klaudius Ivan Anteraja on 14/02/23.
//

import XCTest

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        for word in permutations(of: s1) {
            if s2.contains(word) {
                return true
            }
        }
        
        return false
    }
    
    func permutations(of string: String, current: String = "") -> [String] {
        var result = [String]()
        let length = string.count
        if length == 0 {
            result.append(current)
            return result
        }
        for i in 0..<length {
            let index = string.index(string.startIndex, offsetBy: i)
            let char = string[index]
            let left = String(string[string.startIndex..<index])
            let right = String(string[string.index(after: index)..<string.endIndex])
            result += permutations(of: left + right, current: current + String(char))
        }
        return result
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
    
    func test_checkInclusion_shouldReturnFalseOn_ab_eidboaoo() {
        let sut = Solution()
        
        let result = sut.checkInclusion("ab", "eidboaoo")
        
        XCTAssertFalse(result)
    }
    
    func test_checkInclusion_shouldReturnTrueOn_ab_eidbaooo() {
        let sut = Solution()
        
        let result = sut.checkInclusion("ab", "eidbaooo")
        
        XCTAssertTrue(result)
    }
}
