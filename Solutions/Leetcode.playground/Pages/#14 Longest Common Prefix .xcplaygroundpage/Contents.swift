//: ## #14 Longest Common Prefix
//: [Problem Link](https://leetcode.com/problems/longest-common-prefix/)
/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:

 All given inputs are in lowercase letters a-z.
 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var pre = strs.first else {
            return ""
        }
        
        for i in 1..<strs.count {
            let cur = strs[i]
            
            var range = cur.range(of: pre)
            
            while range == nil || range!.lowerBound != cur.startIndex {
                if pre.isEmpty {
                    return ""
                }
                
                pre.removeLast()
                range = cur.range(of: pre)
            }
        }
        
        return pre
    }
}

//Solution().longestCommonPrefix(["flower", "flow", "flight"])
//Solution().longestCommonPrefix(["dog", "racecar", "car"])
Solution().longestCommonPrefix(["", "", ""])

//: [Previous](@previous) | [Next](@next)
