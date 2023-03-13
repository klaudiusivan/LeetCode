//
//  ClimbingStairsTests.swift
//  ClimbingStairsTests
//
//  Created by Klaudius Ivan Anteraja on 13/03/23.
//

import XCTest

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n < 4 {
            return n
        }
        
        var fib = [Int](repeating: 0, count: n+2)
        fib[0] = 0
        fib[1] = 1
        
        for i in 2...n+1 {
            fib[i] = fib[i-1] + fib[i-2]
        }
        
        return fib[n+1]
    }
}

/**
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 
 Input: n = 4
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step + 1 step
 2. 1 step + 2 steps + 1 step
 3. 2 steps + 1 step + 1 step
 4. 2 step + 2 step
 5. 1 step + 1 step + 2 step
 
 Input: n = 5
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step + 1 step + 1 step
 2. 1 step + 2 steps + 1 step + 1 step
 3. 2 steps + 1 step + 1 step + 1 step
 4. 2 step + 2 step + 1 step
 5. 1 step + 1 step + 2 step + 1 step
 6. 1 step + 1 step + 1 step + 2 step
 7. 1 +  2 + 2
 8. 2 + 1 + 2
  

 Constraints:
 1 <= n <= 45
 */
final class ClimbingStairsTests: XCTestCase {

    func test_climbStairs_shouldReturn0On0Input() {
        let sut = Solution()
        
        let result = sut.climbStairs(0)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_climbStairs_shouldReturn3On3Input() {
        let sut = Solution()
        
        let result = sut.climbStairs(3)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_climbStairs_shouldReturn5In4Input() {
        let sut = Solution()
        
        let result = sut.climbStairs(4)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_climbStairs_shouldReturn8In5Input() {
        let sut = Solution()
        
        let result = sut.climbStairs(5)
        
        XCTAssertEqual(result, 8)
    }
}
