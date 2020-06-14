//: ## #234 Palindrome Linked List
//: [Problem Link](https://leetcode.com/problems/palindrome-linked-list/)
/*
 Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 
 Example 2:

 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        while fast != nil, slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        var rev: ListNode?
        while slow != nil {
            let next = slow?.next
            slow?.next = rev
            
            rev = slow
            slow = next
        }
        
        fast = head
        while rev != nil {
            if rev?.val != fast?.val {
                return false
            }
            
            rev = rev?.next
            fast = fast?.next
        }
        
        return true
    }
}

let l4 = ListNode(1)
let l2 = ListNode(2, l4)
let l1 = ListNode(1, l2)

Solution().isPalindrome(l4)

//: [Previous](@previous) | [Next](@next)
