//
//  Matrix01Tests.swift
//  Matrix01Tests
//
//  Created by Klaudius Ivan Anteraja on 23/02/23.
//

import XCTest

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        
        return []
    }
}
/**
 Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

 The distance between two adjacent cells is 1.

 Example 1:
 Input: mat = [
 [0,0,0],
 [0,1,0],
 [0,0,0]]
 
 Output: [
 [0,0,0],
 [0,1,0],
 [0,0,0]]
 
 Example 2:
 Input: mat = [
 [0,0,0],
 [0,1,0],
 [1,1,1]]
 Output: [
 [0,0,0],
 [0,1,0],
 [1,2,1]]
 */
final class Matrix01Tests: XCTestCase {
    
    func test_updateMatrix_shouldReturnEmptyOnEmptyInput() {
        let sut = Solution()
        
        let result = sut.updateMatrix([])
        
        XCTAssertEqual(result, [])
    }
    
}
