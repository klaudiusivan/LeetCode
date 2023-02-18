//
//  MaxAreaofIslandTests.swift
//  MaxAreaofIslandTests
//
//  Created by Klaudius Ivan Anteraja on 18/02/23.
//

import XCTest

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var result = 0
        var visitedArea = grid
        
        func dfs(_ r: Int,_ c: Int) -> Int {
            
            if r < 0 || r >= visitedArea.count || c < 0 || c >= visitedArea[0].count || visitedArea[r][c] == 0 || visitedArea[r][c] == 2 {
                return 0
            }
            
            visitedArea[r][c] = 2
            return 1 + dfs(r-1, c) + dfs(r+1, c) + dfs(r, c-1) + dfs(r, c+1)
        }
        
        
        for row in 0 ..< visitedArea.count {
            for column in 0 ..< visitedArea[row].count {
                if visitedArea[row][column] == 1 {
                    let count = dfs(row, column)
                    result = max(result, count)
                }
            }
        }
        
        return result
    }
}
/**
 You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 The area of an island is the number of cells with a value 1 in the island.

 Return the maximum area of an island in grid. If there is no island, return 0.

 Example 1:

 Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Output: 6
 Explanation: The answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 Input: grid = [[0,0,0,0,0,0,0,0]]
 Output: 0
 */
final class MaxAreaofIslandTests: XCTestCase {
    func test_maxAreaOfIsland_returnZeroOnEmptyArrayInput() {
        let sut = Solution()
        
        let result = sut.maxAreaOfIsland([])
        
        XCTAssertEqual(result, 0)
    }
    
    func test_maxAreaOfIsland_returnZeroOnNoIslandInput() {
        let sut = Solution()
        
        let result = sut.maxAreaOfIsland([[0,0,0,0,0,0,0,0]])
        
        XCTAssertEqual(result, 0)
    }
    
    func test_maxAreaOfIsland_returnSixOnGivenInput() {
        let sut = Solution()
        
        let result = sut.maxAreaOfIsland(
            [
            [0,0,1,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,1,1,0,1,0,0,0,0,0,0,0,0],
            [0,1,0,0,1,1,0,0,1,0,1,0,0],
            [0,1,0,0,1,1,0,0,1,1,1,0,0],
            [0,0,0,0,0,0,0,0,0,0,1,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0]
        ])
        
        XCTAssertEqual(result, 6)
    }
}
