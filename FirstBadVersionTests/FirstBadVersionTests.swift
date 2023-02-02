//
//  FirstBadVersionTests.swift
//  FirstBadVersionTests
//
//  Created by Klaudius Ivan Anteraja on 02/02/23.
//

import XCTest

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution {
    var theBadVersion: Int!
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left < right {
            let mid = (left + right) / 2
            
            if isBadVersion(mid) == false {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    // MARK: - Helper
    private func isBadVersion(_ version: Int) -> Bool{
        if theBadVersion == nil {
            let random = Int.random(in: 1..<(version+1))
            theBadVersion = random
        }
        return theBadVersion <= version
    }
}

/**
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
*/
final class FirstBadVersionTests: XCTestCase {
    
    func test_firstBadVersion_shouldHaveSameReusltWithTheBadVersion() {
        let sut = Solution()
        
        let result = sut.firstBadVersion(5)
        
        XCTAssertEqual(result, sut.theBadVersion)
    }

}
