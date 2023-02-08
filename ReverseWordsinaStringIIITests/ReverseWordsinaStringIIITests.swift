//
//  ReverseWordsinaStringIIITests.swift
//  ReverseWordsinaStringIIITests
//
//  Created by Klaudius Ivan Anteraja on 08/02/23.
//

import XCTest

class Solution {
    func reverseWords(_ s: String) -> String {
        return ""
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
}
