//: [Previous](@previous)
//: ## Longest Substring Without Repeating Charaters
/*:
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */
//: [Problem link](https://leetcode.com/problems/longest-substring-without-repeating-characters/#/description)

/**
 first readed：1. 不重复的字符个数；2. 而且是最长连接在一起的字符
 */
import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        var hash: [Character: Int] = [:]
        
        var max: Int = 0
        var j: Int = 0
        
        for (i, v) in s.enumerated() {
            if let index = hash[v] {
                j = [j, index + 1].max()!
            }
            
            hash[v] = i
            max = [max, i - j + 1].max()!
        }
        
        return max
    }
}

Solution().lengthOfLongestSubstring("pwwkew")

//: [Next](@next)
