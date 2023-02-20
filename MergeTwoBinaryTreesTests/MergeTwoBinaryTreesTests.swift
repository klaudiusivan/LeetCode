//
//  MergeTwoBinaryTreesTests.swift
//  MergeTwoBinaryTreesTests
//
//  Created by Klaudius Ivan Anteraja on 20/02/23.
//

import XCTest

// Definition for a binary tree node.
public class TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }
    
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
       
        if root1 == nil {
            return root2
        }
        
        if root2 == nil {
            return root1
        }
        
        root1?.val += (root2?.val ?? 0)
        root1?.left = mergeTrees(root1?.left, root2?.left)
        root1?.right = mergeTrees(root1?.right, root2?.right)
        return root1
    }
    
    
}

/**
 You are given two binary trees root1 and root2.

 Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.

 Return the merged tree.

 Note: The merging process must start from the root nodes of both trees

 Example 1:
 Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
 Output: [3,4,5,5,4,null,7]
 Example 2:

 Input: root1 = [1], root2 = [1,2]
 Output: [2,2]*/
final class MergeTwoBinaryTreesTests: XCTestCase {
    func test_mergeTrees_shouldReturnNilOnNilInput() {
        let sut = Solution()
        
        let result = sut.mergeTrees(nil, nil)
        
        XCTAssertNil(result)
    }
    
    func test_mergeTrees_shouldReturnMergeTreesOfTwoInput() {
        let sut = Solution()
        
        let result = sut.mergeTrees(.init(1), .init(1, .init(2), nil))
        
        XCTAssertEqual(result, TreeNode(2, TreeNode(2), nil))
    }
    
}
