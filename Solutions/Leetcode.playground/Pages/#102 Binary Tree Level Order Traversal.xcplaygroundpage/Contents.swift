//: ## #102 Binary Tree Level Order Traversal
//: [Problem Link](https://leetcode.com/problems/binary-tree-level-order-traversal/)
/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
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

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let root = root else { return [[Int]]() }
        
        var vals = [[root.val]]
        var next = nextLevelArray([root])
        while !next.0.isEmpty {
            vals.append(next.0)
            next = nextLevelArray(next.1)
        }
        
        return vals
    }
    
    func nextLevelArray(_ array: [TreeNode]) -> ([Int], [TreeNode]) {
        var nextLevel = [Int]()
        var nextTrees = [TreeNode]()
        for tree in array {
            if let left = tree.left {
                nextLevel.append(left.val)
                nextTrees.append(left)
            }
            
            if let right = tree.right {
                nextLevel.append(right.val)
                nextTrees.append(right)
            }
        }
        
        return (nextLevel, nextTrees)
    }
}

class Solution1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var rs = [[Int]]()
        guard let root = root else { return rs }
        
        var nextTreeNodes = [root]
        while !nextTreeNodes.isEmpty {
            var vals = [Int]()
            
            let count = nextTreeNodes.count
            for _ in 0..<count {
                let treeNode = nextTreeNodes.removeFirst()
                vals.append(treeNode.val)
                
                if let left = treeNode.left {
                    nextTreeNodes.append(left)
                }
                
                if let right = treeNode.right {
                    nextTreeNodes.append(right)
                }
            }
            
//            for treeNode in nextTreeNodes {
//
//            }
            
            // nextTreeNodes = next
            rs.append(vals)
        }
        
        return rs
    }
}

class SolutionDFS {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var rs = [[Int]]()
        
        helper(&rs, root, 0)
        return rs
    }
    
    func helper(_ array: inout [[Int]], _ treeNode: TreeNode?, _ depth: Int) {
        guard let root = treeNode else { return }
        
        if depth >= array.count {
            array.append([Int]())
        }
        
        array[depth].append(root.val)
        
        helper(&array, root.left, depth + 1)
        helper(&array, root.right, depth + 1)
    }
}

//: [Previous](@previous) | [Next](@next)
