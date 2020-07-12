//: ## #101 Symmetric Tree
//: [Problem Link](https://leetcode.com/problems/symmetric-tree/)
/*
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 But the following [1,2,2,null,3,null,3] is not:

     1
    / \
   2   2
    \   \
    3    3
  

 Follow up: Solve it both recursively and iteratively.
 */

import Foundation

/*
 * Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if let root = root {
            return isMirrorNode(root.left, root.right)
        }
        
        return true
    }
    
    func isMirrorNode(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if let node1 = node1, let node2 = node2 {
            if node1.val == node2.val &&
                isMirrorNode(node1.left, node2.right) &&
                isMirrorNode(node1.right, node2.left) {
                return true
            } else {
                return false
            }
        } else if node1 == nil, node2 == nil {
            return true
        } else {
            return false
        }
    }
    
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        if let root = root {
            var array = [TreeNode?]()
            array.append(root.left)
            array.append(root.right)
            
            while !array.isEmpty {
                let t1 = array.popLast()
                let t2 = array.popLast()
                
                if let _ = t1, let _ = t2 {
                    
                } else if t1 == nil, t2 == nil {
                    
                } else {
                    
                }
            }
        }
        
        return true
    }
}

Solution().isSymmetric(nil)

//: [Previous](@previous) | [Next](@next)
