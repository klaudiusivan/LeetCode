//
//  RottingOrangesTests.swift
//  RottingOrangesTests
//
//  Created by Klaudius Ivan Anteraja on 28/02/23.
//

import XCTest

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rowCount = grid.count
        let columnCount = grid.first?.count ?? 0
        let direction: [Int] = [0,1,0,-1,0]
        var queueRotten: [(row: Int, column:Int)] = []
        
        // get allFirstRotten Orange and count good orange to compare at end of operation
        var goodOrangeCount: Int = 0
        grid.enumerated().forEach({
            let row = $0
            $1.enumerated().forEach({
                let column = $0
                if $1 == 2 {
                    queueRotten.append((row, column))
                } else if $1 == 1 {
                    goodOrangeCount += 1
                }
            })
        })
        
        var timer: Int = 0
        var newQueueRotten: [(row: Int, column:Int)] = []
        var someOrangeAffected:[Bool] = []
        while !queueRotten.isEmpty || !newQueueRotten.isEmpty {
            let (row, column) = queueRotten.removeFirst()
            
            for index in 0..<4 {
                let (nextRow, nextColumn) = (row + direction[index], column + direction[index + 1])
                
                if nextRow < 0 || nextRow == rowCount || nextColumn < 0 || nextColumn == columnCount || grid[nextRow][nextColumn] == 2 || grid[nextRow][nextColumn] == 0 {
                    continue
                }
                
                //next row && next column valid change to rotten
                grid[nextRow][nextColumn] = 2
                newQueueRotten.append((nextRow, nextColumn))
                goodOrangeCount -= 1
                someOrangeAffected.append(true)
            }
            
            if queueRotten.isEmpty && someOrangeAffected.contains(true) {
                timer += 1
            }
            
            //refill que rotten oranges
            if !newQueueRotten.isEmpty && queueRotten.isEmpty {
                queueRotten = newQueueRotten
                newQueueRotten = []
                someOrangeAffected = []
            }
        }
        
        return (goodOrangeCount > 0 || grid.count == 0) ? -1 : timer
    }
}


/**
 
 You are given an m x n grid where each cell can have one of three values:

 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

 Example 1:

 Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:

 Input: grid =
 Output: -1
 Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:

 Input: grid = [[0,2]]
 Output: 0
 Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.

 */
final class RottingOrangesTests: XCTestCase {
    func test_orangesRotting_shouldReturnMinus1OnEmptyArray() {
        let sut = Solution()
        
        let result = sut.orangesRotting([])
        
        XCTAssertEqual(result, -1)
    }
    
    func test_orangesRotting_shouldReturnZeroOnOnlyRottenTomatoes() {
        let sut = Solution()
        
        let result = sut.orangesRotting([[0,2]])
        
        XCTAssertEqual(result, 0)
    }
    
    func test_orangesRotting_shouldReturn4ForGivenMatrixOranges() {
        let sut = Solution()
        
        let result = sut.orangesRotting([[2,1,1],
                                         [1,1,0],
                                         [0,1,1]])
        
        XCTAssertEqual(result, 4)
    }
    
    func test_orangesRotting_shouldReturnMinusOneOnUnconnectedRottenTomatoes() {
        let sut = Solution()
        
        let result = sut.orangesRotting([[2,1,1],
                                         [0,1,1],
                                         [1,0,1]])
        
        XCTAssertEqual(result, -1)
    }
}
