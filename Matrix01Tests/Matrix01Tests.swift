//
//  Matrix01Tests.swift
//  Matrix01Tests
//
//  Created by Klaudius Ivan Anteraja on 23/02/23.
//

import XCTest

class Solution {
    
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        guard !mat.isEmpty else { return mat }
        
        let rowCount = mat.count
        let columnCount = mat[0].count
        var mat = mat
        let direction = [0,1,0,-1,0]
        var queue: [(r: Int, c: Int)] = []
        for row in 0..<mat.count {
            for column in 0..<mat[row].count {
                if mat[row][column] == 0 {
                    queue.append((row, column))
                } else {
                    mat[row][column] = -1 // Marked as not processed yet!
                }
            }
        }
        
        while !queue.isEmpty {
            let (row, column) = queue.removeFirst()
            
            for index in 0..<4 {
                let (nextRow, nextColumn) = (row + direction[index], column + direction[index + 1])
                print("next row: \(nextRow)")
                print("next Column: \(nextColumn)")
                if nextRow < 0 || nextRow == rowCount || nextColumn < 0  || nextColumn == columnCount || mat[nextRow][nextColumn] != -1 {
                    continue
                }
                
                mat[nextRow][nextColumn] = mat[row][column] + 1
                queue.append((nextRow, nextColumn))
            }
        }
        
        return mat
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
    
    func test_updateMatrix_shouldReturnZeroOnInput1x1Matrix() {
        let sut = Solution()
        
        let result = sut.updateMatrix([[0]])
        
        XCTAssertEqual(result, [[0]])
    }
    
    func test_updateMatrix_shouldReturn1_0OnInpuut2x1Matrix() {
        let sut = Solution()
        
        let result = sut.updateMatrix([[1,0]])
        
        XCTAssertEqual(result, [[1,0]])
    }
    
    func test_updateMatrix_shouldReturn2_1_0OnInpuut3x1Matrix() {
        let sut = Solution()
        
        let result = sut.updateMatrix([[1,1,0]])
        
        XCTAssertEqual(result, [[2,1,0]])
    }
}
