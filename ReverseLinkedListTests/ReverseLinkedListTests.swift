//
//  ReverseLinkedListTests.swift
//  ReverseLinkedListTests
//
//  Created by Klaudius Ivan Anteraja on 05/03/23.
//

import XCTest

//Definition for singly-linked list.
public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val &&
        lhs.next == rhs.next &&
        lhs.next?.val == rhs.next?.val
    }
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
     
        if head == nil || head?.next == nil {
            return head
        } else {
            let node = self.reverseList(head?.next)
            head?.next?.next = head
            head?.next = nil
            return node
        }
    }
}

/**
 Given the head of a singly linked list, reverse the list, and return the reversed list.

 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 
 Example 2:
 Input: head = [1,2]
 Output: [2,1]
 
 Example 3:
 Input: head = []
 Output: []
 */
final class ReverseLinkedListTests: XCTestCase {
    func test_reverseList_shouldReturnNilOnNilInput() {
        let sut = Solution()
        
        let result = sut.reverseList(nil)
        
        XCTAssertNil(result)
    }
    
    func test_reverseList_shouldReturnReverseList2andOne() {
        let sut = Solution()
        
        let result = sut.reverseList(.init(1, .init(2)))
        
        XCTAssertEqual(result, .init(2, .init(1)))
    }
    
    func test_reverseList_shouldReturnReverseList54321() {
        let sut = Solution()
        
        let result = sut.reverseList(.init(1, .init(2, .init(3, .init(4, .init(5))))))
        
        XCTAssertEqual(result, .init(.init(5, .init(4, .init(3, .init(2, .init(1)))))))
    }
}
