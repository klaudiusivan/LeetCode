//
//  LongestSubstringWithoutRepeatingCharactersTests.swift
//  LongestSubstringWithoutRepeatingCharactersTests
//
//  Created by Klaudius Ivan Anteraja on 13/02/23.
//

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var uniqueSubstring: [Character] = []
        
        var maximumCount = 0
        for character in s.enumerated() {
            if uniqueSubstring.contains(character.element) {
                while true {
                    uniqueSubstring.removeFirst()
                    if !uniqueSubstring.contains(character.element) {
                        uniqueSubstring.append(character.element)
                        break
                    }
                }
            } else {
                uniqueSubstring.append(character.element)
            }
                        
            maximumCount = max(uniqueSubstring.count, maximumCount)
        }
        
        return maximumCount
    }
}
/**
 Given a string s, find the length of the longest
 substring
  without repeating characters.
 
 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  
 */
final class LongestSubstringWithoutRepeatingCharactersTests: XCTestCase {
    
    func test_lengthOfLongestSubstring_shouldReturnZeroOnEmptyInput() {
        
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("")
        
        XCTAssertEqual(result, 0)
    }


    func test_lengthOfLongestSubstring_shouldReturnOneOnDuplicateOneCharacter() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("aaaaaaaa")
        
        XCTAssertEqual(result, 1)
    }
    
    func test_lengthOfLongestSubstring_shouldReturnOneOnDuplicateMultipleCharacter() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("aaafasdfasdcccasfsfaaaaa")
        
        XCTAssertEqual(result, 5)
    }
    
    func test_lengthOfLongestSubstring_shouldReturnFourOnEventCountDuplicateMultipleCharacter() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("pwwkew")
        
        XCTAssertEqual(result, 3)
    }
    
    func test_lengthOfLongestSubstring_shouldReturn5OnInput_qrsvbspk_() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("qrsvbspk")
        
        XCTAssertEqual(result, 5)
    }
}
