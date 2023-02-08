//
//  ReverseWordsinaStringIIITests.swift
//  ReverseWordsinaStringIIITests
//
//  Created by Klaudius Ivan Anteraja on 08/02/23.
//

import XCTest

class Solution {
    
    func reverseWords(_ s: String) -> String {
        
        let words = s.split(separator: " ")
        
        let reversedWords = words.map({
            var temp = Array($0)
            reverseString(&temp)
            return String(temp)
        })
        
        return reversedWords.joined(separator: " ")
    }
    
    private func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            let temp = s[right]
            s[right] = s[left]
            s[left] = temp
            left += 1
            right -= 1
        }
    }
}

/**
 Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 Example 1:

 Input: s = "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Example 2:

 Input: s = "God Ding"
 Output: "doG gniD"
   
 */
final class ReverseWordsinaStringIIITests: XCTestCase {

    func test_reverseWords_shouldReturnEmptyStringOnEmptyInput() {
        let sut = Solution()
        
        let result = sut.reverseWords("")
        
        XCTAssertEqual(result, "")
    }
    
    func test_reverseWords_shouldReverseWordInTheSameOrder() {
        let sut = Solution()
        
        let result = sut.reverseWords("God Ding")
        
        XCTAssertEqual(result, "doG gniD")
    }
    
    func test_reverseWords_shouldReverse_LetsTakeLeetCodeContest_steLekatedoCteeLtsetnoc() {
        let sut = Solution()
        
        let result = sut.reverseWords("Let's take LeetCode contest")
        
        XCTAssertEqual(result, "s'teL ekat edoCteeL tsetnoc")
    }
}
