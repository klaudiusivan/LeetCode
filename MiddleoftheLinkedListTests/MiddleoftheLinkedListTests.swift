//
//  MiddleoftheLinkedListTests.swift
//  MiddleoftheLinkedListTests
//
//  Created by Klaudius Ivan Anteraja on 09/02/23.
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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}


/**
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.

  
 Example 1:

 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 Example 2:

 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 */
final class MiddleoftheLinkedListTests: XCTestCase {

    func test_middleNode_shouldReturnNilOnNilInput() {
        let sut = Solution()
        
        let result = sut.middleNode(nil)
        
        XCTAssertNil(result)
    }
    
    func test_middleNode_shouldReturnTheHalfElementOfOddList() {
        let sut = Solution()
        let head = ListNode(1, .init(2, .init(3, .init(4, .init(5)))))
        
        
        let result = sut.middleNode(head)
        
        XCTAssertEqual(result?.val, 3)
    }
    
    func test_middleNode_shouldReturnTheHalfElementOfEvenList() {
        let sut = Solution()
        let head = ListNode(1, .init(2, .init(3, .init(4))))
        
        
        let result = sut.middleNode(head)
        
        XCTAssertEqual(result?.val, 3)
    }
    
}
