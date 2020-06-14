//: ## #28 Implement strStr()
//: [Problem Link](https://leetcode.com/problems/implement-strstr/)

/*
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */

import Foundation

class Solution {
    /*
     第一次思路: 遍历haystack，匹配needle从第一个到最后一个
     最终结果会超时
     
     未考虑到位点:
     1. haystack为空needle不为空时也是返回-1
     2. needle长度 > haystack时
     */
    
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        if needle.isEmpty {
//            return 0
//        }
//
//        if needle.count > haystack.count {
//            return -1
//        }
//
//        var start = haystack.startIndex;
//        // 这里应该要想到后面count大于前面时的情况!
//        let end = haystack.index(start, offsetBy: haystack.count - needle.count + 1)
//
//        while start != end {
//            var next = start
//
//            for (i, c) in needle.enumerated() {
//                if c != haystack[next] {
//                    break
//                }
//
//                if i == needle.count - 1 {
//                    return haystack.distance(from: haystack.startIndex, to: start)
//                }
//                next = haystack.index(after: next)
//            }
//
//            start = haystack.index(after: next)
//        }
//
//        return -1
//    }
    
    // 第二次思路: 直接匹配needle头和尾
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0;
        }
        
        guard haystack.count >= needle.count else {
            return -1;
        }
        
        let distance = haystack.count - needle.count
        for i in 0...distance {
            let start = haystack.index(haystack.startIndex, offsetBy: i)
            let end = haystack.index(haystack.startIndex, offsetBy: i+needle.count)
            
            if haystack[start..<end] == needle {
                return haystack.distance(from: haystack.startIndex, to: start)
            }
        }
        
        return -1
    }
}

Solution().strStr("asdasd", "asd");

//: [Previous](@previous) | [Next](@next)
