//
//  RemoveNthNodeFromEndofListTests.swift
//  RemoveNthNodeFromEndofListTests
//
//  Created by Klaudius Ivan Anteraja on 10/02/23.
//

import XCTest


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head
        var fast = head
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        if fast == nil {
            return head?.next
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return head
    }
}

/**
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

 Example 1:
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]

 Example 2:
 Input: head = [1], n = 1
 Output: []
 
 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]
 */
final class RemoveNthNodeFromEndofListTests: XCTestCase {

    func test_removeNthFromEnd_shouldReturnNilOnNilHead() {
        let sut = Solution()
        
        let result = sut.removeNthFromEnd(nil, 10)
        
        XCTAssertNil(result)
    }
    
    func test_removeNthFromEnd_shouldReturnEmptyArrayOnSingleNode() {
        let sut = Solution()
        
        let result = sut.removeNthFromEnd(ListNode(1), 1)
        
        XCTAssertNil(result)
    }
    
    func test_removeNthFromEnd_shouldReturnArrayWithoutNumber4TheSecondIndexFromLastINdex() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)

        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let sut = Solution()
        
        let result = sut.removeNthFromEnd(node1, 2)
        
        let resultInArray = Array(sequence(first: result!, next: { $0.next })).map({ $0.val })
        
        XCTAssertEqual(resultInArray, [1,2,3,5])

    }

}
