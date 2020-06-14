//: ## Valid Palindrome
//: [Problem Link](https://leetcode.com/problems/valid-palindrome/)

import Foundation

/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */

/*
 我的思路：
    1. 先全小写处理
    2. 使用两个位置指针，一个开始位置，一个末尾位置
    3. 开始循环，指针向中间靠拢，判断两个位置是否相等且为alphanumeric characters(字母数字字符)
 */


// 此方法超时
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            // 空是valid palindrome
            return true
        }
        
        var start = 0
        var end = s.count - 1
        
        while start < end {
            let startString = s[s.index(s.startIndex, offsetBy: start)]
            let endString = s[s.index(s.startIndex, offsetBy: end)]
            print("\(startString) ----- \(endString)")
            let startIsAlphanumber = startString.isLetter || startString.isNumber
            let endIsAlphanumber = endString.isLetter || endString.isNumber
            // 字符判断
            if startIsAlphanumber && endIsAlphanumber {
                if startString.lowercased() != endString.lowercased() {
                    // 不同直接跳出
                    return false
                }
                
                end -= 1
                start += 1
            } else {
                // 不为字符跳过
                if !startIsAlphanumber {
                    start += 1
                }
                
                if !endIsAlphanumber {
                    end -= 1
                }
            }
        }
        
        // 没有不同循环结束了
        return true
    }
}


class Solution1 {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        
        var leftIndex = s.startIndex
        var rightIndex = s.index(before: s.endIndex)
        
        while leftIndex < rightIndex {
            while !s[leftIndex].isNumber && !s[leftIndex].isLetter {
                leftIndex = s.index(after: leftIndex)
                if leftIndex == s.endIndex { return true }
            }
            while !s[rightIndex].isNumber && !s[rightIndex].isLetter {
                rightIndex = s.index(before: rightIndex)
                if rightIndex == s.startIndex { return true }
            }
            
            if s[rightIndex].lowercased() != s[leftIndex].lowercased() {
                return false
            }
            leftIndex = s.index(after: leftIndex)
            rightIndex = s.index(before: rightIndex)
        }
        return true
    }
}

Solution().isPalindrome("")


//: [Previous](@previous) | [Next](@next)
