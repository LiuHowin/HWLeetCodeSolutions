//: ## #98 Validate Binary Search Tree
//: [Problem Link](https://leetcode.com/problems/validate-binary-search-tree/)
/*
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:

     2
    / \
   1   3

 Input: [2,1,3]
 Output: true
 Example 2:

     5
    / \
   1   4
      / \
     3   6

 Input: [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 */

import Foundation

//  Definition for a binary tree node.
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

// 所有左边的节点都要小于根节点, 右大根

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return helper(root, nil, nil)
    }
    
    func helper(_ node: TreeNode?, _ lower: Int?, _ upper: Int?) -> Bool {
        guard let node = node else {
            return true
        }
        
        if let lower = lower, node.val <= lower {
            return false
        }
        
        if let upper = upper, node.val >= upper {
            return false
        }
        
        
        if !helper(node.right, node.val, upper) {
            return false
        }
        
        if !helper(node.left, lower, node.val) {
            return false
        }
        
        return true
    }
}

let t6 = TreeNode(6)
let t20 = TreeNode(20)
let t15 = TreeNode(15)

let t5 = TreeNode(5)

let t10 = TreeNode(10, t5, t15)

Solution().isValidBST(t10)

//: [Previous](@previous) | [Next](@next)
