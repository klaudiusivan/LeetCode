//
//  PopulatingNextRightPointersInEachNodeTests.swift
//  PopulatingNextRightPointersInEachNodeTests
//
//  Created by Klaudius Ivan Anteraja on 21/02/23.
//

import XCTest


// Definition for a Node.
public class Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.val == rhs.val &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right &&
        lhs.next == rhs.next
    }
    
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
 

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let notNilRoot = root else {
            return nil
        }
        notNilRoot.left?.next = notNilRoot.right
        notNilRoot.right?.next = notNilRoot.next?.left
        let _ = connect(notNilRoot.left)
        let _ = connect(notNilRoot.right)
        return notNilRoot
    }
}

/**
 You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.


 Example 1:

 Input: root = [1,2,3,4,5,6,7]
 Output: [1,#,2,3,#,4,5,6,7,#]
 Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 Example 2:

 Input: root = []
 Output: []
 */
final class PopulatingNextRightPointersInEachNodeTests: XCTestCase {
    func test_connect_shouldReturnNilOnNilInput() {
        let sut = Solution()
        
        let result = sut.connect(nil)
        
        XCTAssertNil(result)
    }
    
    func test_connect_shouldReturnRootWithNextRightNode() {
        
        let sut = Solution()
        let root = Node(1)
        root.left = Node(2)
        root.right = Node(3)
        root.left?.left = Node(4)
        root.left?.right = Node(5)
        root.right?.left = Node(6)
        root.right?.right = Node(7)
        
        let exp = Node(1)
        exp.left = Node(2)
        exp.right = Node(3)
        exp.left?.left = Node(4)
        exp.left?.right = Node(5)
        exp.right?.left = Node(6)
        exp.right?.right = Node(7)
        exp.left?.next = root.right
        exp.left?.left?.next = root.left?.right
        exp.left?.right?.next = root.right?.left
        exp.right?.left?.next = root.right?.right
        
        let result = sut.connect(root)
        
        XCTAssertEqual(result, exp)
    }
}
