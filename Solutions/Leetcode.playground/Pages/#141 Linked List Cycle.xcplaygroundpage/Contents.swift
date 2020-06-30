//: ## #141 Linked List Cycle
//: [Problem Link](https://leetcode.com/problems/linked-list-cycle/)

//: ![Example 1](circularlinkedlist.png "Example 1")

//: ![Example 2](circularlinkedlist_test2.png "Example 2")

//: ![Example 3](circularlinkedlist_test3.png "Example 3")
/*
 Given a linked list, determine if it has a cycle in it.

 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
 
 Example 1:

 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the second node.


 Example 2:

 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the first node.


 Example 3:

 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.


  

 Follow up:

 Can you solve it using O(1) (i.e. constant) memory?
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


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head?.next
        var slow = head
        
        if fast == nil || slow == nil {
            return false
        }
        
        while fast !== slow {
            if fast == nil || slow == nil {
                return false
            }
            
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return true
    }
}

let l1 = ListNode(1)
let l2 = ListNode(2, l1)
l1.next = l2

Solution().hasCycle(l1)

//: [Previous](@previous) | [Next](@next)
