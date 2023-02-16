//
//  PermutationInStringTests.swift
//  PermutationInStringTests
//
//  Created by Klaudius Ivan Anteraja on 14/02/23.
//

import XCTest

//        ab cdeba
//        01 23410
//             l r
//     s1 abcdefghijklmnopqrstuvwxyz
//        11000000000000000000000000
//     s2 abcdefghijklmnopqrstuvwxyz
//        11000000000000000000000000
//
//        identicCounter 26
class Solution {
    
    ///window sliding solution
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else {
            return false
        }
        let alphabethCount = 26
        var s1Chars = Array(s1.unicodeScalars)
        var s2Chars = Array(s2.unicodeScalars)
        
        let length1 = s1Chars.count
        let length2 = s2Chars.count
        var counts = Array(repeating: 0, count: alphabethCount)
        
        for i in 0 ..< length1 {
            counts [alphabethIndex(of: s1Chars[i])] += 1
            counts [alphabethIndex(of: s2Chars[i])] -= 1
        }
        if allZero(counts) { return true }
        //ab cdeab
        //     l r
        //abcdefghijklmnopqrstuvwxyz
        //00000000000000000000000000
        
        for i in length1 ..< length2 {
            counts[alphabethIndex(of: s2Chars[i])] -= 1
            counts[alphabethIndex(of: s2Chars[i - length1])] += 1
            if allZero(counts) { return true }
        }
        return false
    }
    func allZero(_ counts: [Int]) -> Bool {
        for i in 0 ..< 26 {
            if counts[i] != 0 {
                return false
            }
        }
        return true
    }
    func alphabethIndex(of character: String.UnicodeScalarView.Element) -> Int {
        Int(character.value - 97)
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
    
    func test_checkInclusion_shouldReturnFalseOn_hello_ooolleoooleh() {
        let sut = Solution()
        
        let result = sut.checkInclusion("hello", "ooolleoooleh")
        
        XCTAssertFalse(result)
    }
}
