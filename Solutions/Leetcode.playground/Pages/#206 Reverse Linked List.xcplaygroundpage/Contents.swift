//: ## Reverse Linked List
//: [Problem Link](https://leetcode.com/problems/reverse-linked-list/)
/*
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        
        var next: ListNode? = head
        while next != nil {
            let temp = dummy.next
            dummy.next = next
            
            next = next?.next
            dummy.next?.next = temp
        }
        
        return dummy.next
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil, let node = head else {
            return head
        }
        
        let p = reverseList(node.next)
        node.next?.next = node
        node.next = nil
        
        return p
    }
}

let five = ListNode(5)
let four = ListNode(4, five)
let three = ListNode(3, four)
let two = ListNode(2, three)
let one = ListNode(1, two)

//var node = Solution().reverseList(one)
var node = Solution().reverseList1(one)
while node != nil {
    print(node!.val)
    node = node?.next
}

//: [Previous](@previous) | [Next](@next)
