//
//  ReverseStringTests.swift
//  ReverseStringTests
//
//  Created by Klaudius Ivan Anteraja on 08/02/23.
//

import XCTest

class Solution {
    
    ///using O(1) algorithm because change array at a time
    func reverseString(_ s: inout [Character]) {
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
 Write a function that reverses a string. The input string is given as an array of characters s.

 You must do this by modifying the input array in-place with O(1) extra memory.

 ~~~
 Example 1:

 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
 ~~~
 */
final class ReverseStringTests: XCTestCase {

    func test_reverseString_shouldResultEmptyArrayWithEmptyArrayInput() {
        let sut = Solution()
        
        var strings: [Character] = []
        
        sut.reverseString(&strings)
        
        XCTAssertEqual(strings, [])
    }
    
    func test_reverseString_shouldReverseString_hello_Result_olleh_() {
        let sut = Solution()
        
        var strings: [Character] = ["h","e","l","l","o"]
        
        sut.reverseString(&strings)
        
        XCTAssertEqual(strings, ["o","l","l","e","h"])
    }
    
    func test_reverseString_shouldReverseString_Hannah_Result_hannaH() {
        let sut = Solution()
        
        var strings: [Character] = ["H","a","n","n","a","h"]
        
        sut.reverseString(&strings)
        
        XCTAssertEqual(strings, ["h","a","n","n","a","H"])
    }
}
