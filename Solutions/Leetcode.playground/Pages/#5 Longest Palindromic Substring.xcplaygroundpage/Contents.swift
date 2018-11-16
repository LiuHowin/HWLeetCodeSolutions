//: [Previous](@previous)
/*:
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example:
 
 Input: "babad"
 
 Output: "bab"
 
 Note: "aba" is also a valid answer.
 Example:
 
 Input: "cbbd"
 
 Output: "bb"
 */
//: [Problem link](https://leetcode.com/problems/longest-palindromic-substring/#/description)

// 回文(Palindrome)字串：正反读都一样
class Solution {
    func longestPalindrome(_ s: String) -> String {
        
        //        var reverseString = ""
        //        for character in s.characters {
        //            reverseString.insert(character, at: reverseString.startIndex)
        //        }
        //        var rCharasctersArray = [Character](reverseString.characters)
        
        // 将字符串字符组成数组
        let charasctersArray = [Character](s.characters)
        
        var start = 0, end = 0
        for (i, _) in charasctersArray.enumerated() {
            // 两种情况
            let len1 = expandAroundCenter(S: charasctersArray, left: i, right: i)
            let len2 = expandAroundCenter(S: charasctersArray, left: i, right: i + 1)
            let len = max(len1, len2)
            
            if len > end - start {
                
                start = i - (len - 1) / 2
                end = i + len / 2
            }
            
        }
        
        return String(charasctersArray[start...end])
    }
    // 向外扩张（利用了回文的特性）
    func expandAroundCenter(S: [Character], left: Int, right: Int) -> Int {
        var l = left
        var r = right
        
        while l >= 0 && r < S.count && S[l] == S[r] {
            l = l - 1
            r = r + 1
        }
        
        return r - l - 1
    }
}

// 我的垃圾解法
//class Solution1 {
//    func longestPalindrome(_ s: String) -> String {
//        var rS = ""
//
//        for character in s.characters {
//            rS.insert(character, at: rS.startIndex)
//        }
//
//        let sArray = [Character](s.characters)
//        let rSArray = [Character](rS.characters)
//
//        var start = 0
//        var end = 0
//
//        for (i, val) in sArray.enumerated() {
//
//            for (y, rVal) in rSArray.enumerated() {
//                var len = 0
//                if rVal != val {
//                    continue
//                }
//
//                var index = y
//                while len + i < sArray.count && index < sArray.count && sArray[len + i] == rSArray[index]{
//                    len += 1
//                    index += 1
//                }
//
//                if end - start < len && (sArray.count - index) == i {
//                    start = i
//                    end = len + i
//                }
//            }
//        }
//
//        return String(sArray[start..<end])
//    }
//}

Solution().longestPalindrome("abcdasdfghjkldcba")

//Solution1().longestPalindrome("abcdasdfghjkldcba") // aaabaa

//: [Next](@next)
