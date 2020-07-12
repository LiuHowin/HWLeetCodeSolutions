//: ## #108 Convert Sorted Array to Binary Search Tree
//: [Problem Link](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)
/*
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted array: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 */

import Foundation

// Definition for a binary tree node.
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        
        let half = nums.count / 2
        let head = TreeNode(nums[half])
        if half != 0 {
            head.left = sortedArrayToBST(Array(nums[0..<half]))
            
            if half < nums.count - 1 {
                head.right = sortedArrayToBST(Array(nums[half + 1..<nums.count]))
            }
        }
        
        return head
    }
    
    func sortedArrayToBST1(_ nums: [Int]) -> TreeNode? {
        let head = helper(nums, 0, nums.count - 1)
        return head
    }
    
    func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let mid = (left + right + 1) / 2
        let node = TreeNode(nums[mid])
        node.left = helper(nums, left, mid - 1)
        node.right = helper(nums, mid + 1, right)
        
        return node
    }
}

Solution().sortedArrayToBST([-10,-3,0,5,9])

//: [Previous](@previous) | [Next](@next)
