//
//  MergeTwoSortedListTests.swift
//  MergeTwoSortedListTests
//
//  Created by Klaudius Ivan Anteraja on 04/03/23.
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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        else if list2 == nil {
            return list1
        }
        
        if list1?.val ?? 0 < list2?.val ?? 0 {
            return ListNode(list1!.val, mergeTwoLists(list1?.next, list2))
        } else {
            return ListNode(list2!.val, mergeTwoLists(list1, list2?.next))
        }
    }
}

/**
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

 Example 1:
 
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:

 Input: list1 = [], list2 = []
 Output: []

 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]

 */
final class MergeTwoSortedListTests: XCTestCase {
    func test_mergeTwoLists_shouldReturnNilOnEmptyInput() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(nil, nil)
        
        XCTAssertNil(result)
    }
    
    func test_mergeTwoLists_shouldReturnListTwoWithListOneNil() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(nil, ListNode(0))
        
        XCTAssertEqual(result, ListNode(0))
    }
    
    func test_mergeTwoLists_shouldReturnListOneWithListTwoNil() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(ListNode(0), nil)
        
        XCTAssertEqual(result, ListNode(0))
    }
    
    func test_mergeTwoList_shouldReturnMergeList() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))
        
        XCTAssertEqual(result, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4)))))), "result: \(linkedListToArray(result)) not same with expected")
    }
    
    // MARK: - Helper
    func linkedListToArray(_ headNode: ListNode?) -> [Int] {
        guard let headNode = headNode else { return [] }
        return Array(sequence(first: headNode, next: \.next)).map({ $0.val })
    }
}
