//
//  PermutationInStringTests.swift
//  PermutationInStringTests
//
//  Created by Klaudius Ivan Anteraja on 14/02/23.
//

import XCTest

class Solution {
    
    ///window sliding solution
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else {
            return false
        }
        
        var s1Count = Array(repeating: 0, count: 26)
        var s2Count = Array(repeating: 0, count: 26)
        for index in 0 ..< s1.count {
            s1Count[alphabethIndex(of: Array(s1)[index])] += 1
            s2Count[alphabethIndex(of: Array(s2)[index])] += 1
        }
        
        var identicCounter = 0
        for index in 0 ..< 26 {
            if s1Count[index] == s2Count[index] {
                identicCounter += 1
            }
        }
        
//        ab cdeba
//        01 23410
//             l r
//     s1 a bcdefghijklmnopqrstuvwxyz
//        1 1000000000000000000000000
//     s2 a bcdefghijklmnopqrstuvwxyz
//        1 1000000000000000000000000
//
//        identicCounter 26
        for index in 0 ..< (s2.count - s1.count) {
            let left = alphabethIndex(of: Array(s2)[index])
            let right = alphabethIndex(of: Array(s2)[index + s1.count])
            
            if identicCounter == 26 {
                return true
            }
            
            s2Count[right] += 1
            
            if s2Count[right] == s1Count[right] {
                identicCounter += 1
            } else if s2Count[right] == s1Count[right] + 1 {
                identicCounter -= 1
            }
            
            s2Count[left] -= 1
            
            if s2Count[left] == s1Count[left] {
                identicCounter += 1
            } else if s2Count[left] == s2Count[left] - 1{
                identicCounter -= 1
            }
        }
        
        return identicCounter == 26
    }
    
    func alphabethIndex(of character: Character) -> Int {
        Int(character.asciiValue!) - Int(Character("a").asciiValue!)
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

    func test_checkInclusion_shouldReturnTrueOnTwoEmptyInput() {
        let sut = Solution()
        
        let result = sut.checkInclusion("", "")
        
        XCTAssertTrue(result)
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
    
    func test_checkInclusion_shouldReturnTrueOn_ab_ba() {
        let sut = Solution()
        
        let result = sut.checkInclusion("ab", "ba")
        
        XCTAssertTrue(result)
    }
    
    func test_checkInclusion_shouldReturnTrueOn_ab_cdeba() {
        let sut = Solution()
        
        let result = sut.checkInclusion("ab", "cdeba")
        
        XCTAssertTrue(result)
    }
    
    func test_checkInclusion_shouldPassTheTimeLimit() {
        let sut = Solution()
        
        let result = sut.checkInclusion("prosperity", "properties")
        
        XCTAssertFalse(result)
    }
}
