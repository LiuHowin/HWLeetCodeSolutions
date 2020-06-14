//: ## #19 Remove Nth Node From End of List
//: [Problem Link](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
/*
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        var first: ListNode? = dummy
        var second: ListNode? = dummy
        
        for _ in 0...n {
            first = first?.next
        }
        
        while (first != nil) {
            first = first?.next
            second = second?.next
        }
        
        second?.next = second?.next?.next
        
        return dummy.next
    }
    
    func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        var fisrt: ListNode? = dummy
        var length = 0
        while fisrt != nil {
            fisrt = fisrt?.next
            length += 1
        }
        
        fisrt = dummy
        length = length - n - 1
        while length > 0 {
            length -= 1
            fisrt = fisrt?.next
        }
        
        fisrt?.next = fisrt?.next?.next
        return dummy.next
    }
    
    // 错了，是从后往前的第N个
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        guard let head = head else {
//            return nil
//        }
//
//        var index = n
//        var first: ListNode?
//        var second: ListNode? = head
//        while index >= 0 {
//            first = second
//            second = second?.next
//            index -= 1
//        }
//
//        if let pre = first {
//            if let next = second?.next {
//                pre.next = next
//                pre.next?.val = next.val
//            } else {
//                pre.next = nil
//            }
//        }
//
//        return head
//    }
}

let five = ListNode(5)
let four = ListNode(4, five)
let three = ListNode(3, four)
let two = ListNode(2, three)
let one = ListNode(1, two)

//var node = Solution().removeNthFromEnd(one, 3)
var node = Solution().removeNthFromEnd2(one, 0)
while node != nil {
    print(node!.val)
    node = node?.next
}

//: [Previous](@previous) | [Next](@next)
