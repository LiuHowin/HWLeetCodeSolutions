//: https://leetcode.com/problems/add-two-numbers/#/description

/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 Subscribe to see which companies asked this question.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

/**
 一开始没有读懂题，导致没思路和思路错误。。。
 最后答案参照：https://discuss.leetcode.com/topic/799/is-this-algorithm-optimal-or-what
 然后说说个人的不完全理解，首先是链，一开始我一直以为链是需要自己提供算法的，算出2-4-3的，然后没想到就是自己设置下一个节点就是ListNote(4)，- -!。然后是两个链的相加，2 + 5 = 7; 6 + 4 = 10; 3 + 4 = 8?;明显10和8需要处理，然后注意最后一个提示就是，只有0自己才会导出0。需要得出10 -> 0的转变，还有3 + 4到8之间1的差值，还有就是非0导入时，应该怎么处理。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        
        let nr1: ListNode? = ListNode(0) // 最开始的头节点
        var nr: ListNode? = nr1 // 指针传递: 这里这样做为了头节点连上第一个值
        
        var sum: Int = 0
        
        while (n1 != nil || n2 != nil) {
            sum /= 10 // 确保不大于10，而且解决 3 + 4 = 8 之间缺1的问题
            
            if n1 != nil {
                sum += n1?.val ?? 0 // 拿到值求和
                n1 = n1?.next // 下一个节点
            }
            
            if n2 != nil {
                sum += n2?.val ?? 0 // 拿到值求和
                n2 = n2?.next // 下一个节点
            }
            
            // 1. 取余: 解决了10 -> 0的问题
            // 2. 先设置next: 为头节点设置了下一个节点
            // 3. 赋值: 下一个节点是创建的一个新对象，而且指针指向下个节点 -> 指针变了，使得现在这个节点指针非指向头节点指针引用，使得指针指向下个节点继续赋值，保证头节点不变，下个节点一直在动态赋值
            // 个人理解: 这里如果不这样做，就需要在这里只第一次进来时对头节点赋一次值，就需要添加一个判断，这里巧妙的使用了指针的传递，减少了一个判断语句
            nr?.next = ListNode(sum % 10)
            nr = nr?.next
            
        }
        
        if sum / 10 == 1 { // 最后导出结果为0且不是为0开头时，虽然next节点都为空，但是sum还是剩了1出来
            nr?.next = ListNode(1)
        }
        
        return nr1?.next // 头节点：最开始为0，下个节点才是真正的开始
    }
}

let n1 = ListNode(6)
let n2 = ListNode(6)
n1.next = n2
let n3 = ListNode(6)
n2.next = n3

let n4 = ListNode(5)
let n5 = ListNode(5)
n4.next = n5
let n6 = ListNode(5)
n5.next = n6

_  = Solution().addTwoNumbers(n1, n4)





