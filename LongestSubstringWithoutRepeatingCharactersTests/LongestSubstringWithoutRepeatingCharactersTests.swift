//
//  LongestSubstringWithoutRepeatingCharactersTests.swift
//  LongestSubstringWithoutRepeatingCharactersTests
//
//  Created by Klaudius Ivan Anteraja on 13/02/23.
//

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var array = Array(s)
        var left = 0
        var right = array.count - 1
        var uniqueHash: [Character: Int] = [:]
        
        
        while left < right {
            if uniqueHash[array[left]] == nil {
               uniqueHash[array[left]] = 1
            } else {
                uniqueHash[array[left]]! += 1
            }
            
            if uniqueHash[array[right]] == nil {
                uniqueHash[array[right]] = 1
            } else {
                uniqueHash[array[right]]! += 1
            }
            
            left += 1
            right -= 1
        }
        
        return uniqueHash.count
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
}
