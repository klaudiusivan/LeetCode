//
//  FloodFillTests.swift
//  FloodFillTests
//
//  Created by Klaudius Ivan Anteraja on 17/02/23.
//

import XCTest
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        guard sr >= 0 && sr < image.count else { return image }
        
        guard sc >= 0 && sc < image[0].count else { return image }
        
        var result = image
        var queue:[(Int, Int)] = [(sr, sc)]
        let oldColor = image[sr][sc]
        
        if oldColor == color {
            return result
        }
        
        while !queue.isEmpty {
            let (row,column) = queue.removeFirst()
            let selectedPixel = result[row][column]
            if oldColor == selectedPixel {
                result[row][column] = color
                
                //down
                if row < image.count - 1 {
                    queue.append((row+1, column))
                }
                
                //right
                if column < image[0].count - 1 {
                    queue.append((row, column+1))
                }
                
                //left
                if column > 0 {
                    queue.append((row, column-1))
                }
                
                //top
                if row > 0 {
                    queue.append((row-1, column))
                }
            }
            
        }
        return result
    }
}

/**
 An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.

 You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].

 To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.

 Return the modified image after performing the flood fill.

 Example 1:
 Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
 
 Example 2:
 Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
 Output: [[0,0,0],[0,0,0]]
 Explanation: The starting pixel is already colored 0, so no changes are made to the image.
 
 Constraints:

 m == image.length
 n == image[i].length
 1 <= m, n <= 50
 0 <= image[i][j], color < 216
 0 <= sr < m
 0 <= sc < n
 */
final class FloodFillTests: XCTestCase {
    func test_floodFill_shouldReturnEmptyArrayOnEmptyInput() {
        let sut = Solution()

        let result = sut.floodFill([], 5, 3, 2)

        XCTAssertEqual(result, [])
    }
    
    func test_floodFill_shouldReturnZeroOnZeroAllTheInput() {
        let sut = Solution()
        
        let result = sut.floodFill([[0,0,0],[0,0,0]], 0, 0, 0)
        
        XCTAssertEqual(result, [[0,0,0],[0,0,0]])
    }
    
    func test_floodFIll_shouldReturnTheRightColorOfTheConnectedPixel_WithTargetedColor() {
        let sut = Solution()
        
        let result = sut.floodFill([[0,0,0],[0,0,0]], 0, 0, 1)
        
        XCTAssertEqual(result, [[1,1,1],[1,1,1]])
        
    }
    
}
