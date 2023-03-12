//
//  LetterCasePermutationTests.swift
//  LetterCasePermutationTests
//
//  Created by Klaudius Ivan Anteraja on 12/03/23.
//

import XCTest

class Solution {
    func letterCasePermutation(_ s: String) -> Set<String> {
        guard !s.isEmpty else { return [] }
        var results: Set<String> = []
        var strings: [Character] = s.map({ $0 })
        backtracking(characters: &strings, index: 0, results: &results)
        return results
    }
    
    func backtracking(characters: inout [Character], index: Int, results: inout Set<String>) {
        
        if index >= characters.count {
            results.insert(String(characters))
            return
        }
        
        if characters[index].asciiValue! >= Character("0").asciiValue! &&
            characters[index].asciiValue! <= Character("9").asciiValue! {
            backtracking(characters: &characters, index: index+1, results: &results)
            return
        }
        
        characters[index] = Character(characters[index].lowercased())
        backtracking(characters: &characters, index: index+1, results: &results)
        
        characters[index] = Character(characters[index].uppercased())
        backtracking(characters: &characters, index: index+1, results: &results)
        
        
    }
}

/**
 Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.

 Return a list of all possible strings we could create. Return the output in any order.

 Example 1:
 Input: s = "a1b2"
 Output: ["a1b2","a1B2","A1b2","A1B2"]

 Example 2:
 Input: s = "3z4"
 Output: ["3z4","3Z4"]
  
 Constraints:

 1 <= s.length <= 12
 s consists of lowercase English letters, uppercase English letters, and digits.
 */
final class LetterCasePermutationTests: XCTestCase {
    func test_letterCasePermutation_shouldReturnEmptyListOnEmptyS() {
        let sut = Solution()
        
        let result = sut.letterCasePermutation("")
        
        XCTAssertEqual(result, [])
    }
    
    func test_letterCasePermutation_shouldReturnExpectedOutput() {
        let sut = Solution()
        
        let result = sut.letterCasePermutation("a1b2")
        
        XCTAssertEqual(result, ["a1b2","a1B2","A1b2","A1B2"])
    }
}
