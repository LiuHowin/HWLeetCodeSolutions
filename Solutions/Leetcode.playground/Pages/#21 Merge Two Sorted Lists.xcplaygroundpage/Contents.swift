//: ## #21 Merge Two Sorted Lists
//: [Problem Link](https://leetcode.com/problems/merge-two-sorted-lists/)
/*
 Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 */

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


// 注意'return it as a new SORDTED list'
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}

let l4 = ListNode(4)
let l2 = ListNode(2, l4)
let l1 = ListNode(1, l2)

let r5 = ListNode(9)
let r3 = ListNode(8, r5)
let r1 = ListNode(7, r3)

//var node = Solution().removeNthFromEnd(one, 3)
var node = Solution().mergeTwoLists(l1, r1)
while node != nil {
    print(node!.val)
    node = node?.next
}

//: [Previous](@previous) | [Next](@next)
