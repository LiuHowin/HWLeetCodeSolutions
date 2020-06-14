//: ## #8 String to Integer (atoi)
//: [Problem Link](https://leetcode.com/problems/string-to-integer-atoi/)
/*
 Implement atoi which converts a string to an integer.

 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

 If no valid conversion could be performed, a zero value is returned.

 Note:

 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:

 Input: "42"
 Output: 42
 Example 2:

 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
              Then take as many numerical digits as possible, which gets 42.
 Example 3:

 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:

 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
              digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:

 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
              Thefore INT_MIN (−2^31) is returned.
 */

import Foundation

// 又做错了
class Solution {
    func myAtoi(_ str: String) -> Int {
        var cur = str.startIndex
        let end = str.endIndex
        
        var s = [Character]()
        while cur < end {
            let c = str[cur]
            if c.isNumber {
                s.append(c)
            } else {
                if c.isWhitespace {
                    if !s.isEmpty {
                        break
                    }
                } else if c == "+" || c == "-" {
                    if s.isEmpty {
                        s.append(c)
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            
            cur = str.index(after: cur)
        }
        
        let numberStr = String(s)
        // 这里不能这样判断stack overflow
        if numberStr > String(Int32.max) {
            return Int(Int32.max)
        } else if (numberStr < String(Int32.min)) {
            return Int(Int32.min)
        } else {
            return Int(numberStr) ?? 0
        }
    }
}

class Solution1 {
    func myAtoi(_ str: String) -> Int {
        var cur = str.startIndex
        while cur < str.endIndex && str[cur].isWhitespace {
            cur = str.index(after: cur)
        }
        
        if cur == str.endIndex {
            return 0
        }
        
        var sign = 1
        if str[cur] == "+" || str[cur] == "-" {
            if (str[cur] == "-") {
                sign = -1
            } else {
                sign = 1
            }
            
            cur = str.index(after: cur)
        }
        
        var rs = 0
        while cur < str.endIndex && str[cur] >= "0" && str[cur] <= "9" {
            let curInt = Int(String(str[cur]))!
            if rs > Int(Int32.max / 10) || (rs == Int(Int32.max / 10) && curInt > Int(Int32.max) % 10) {
                if sign > 0 {
                    return Int(Int32.max)
                } else {
                    return Int(Int32.min)
                }
            }
            
            rs = rs * 10 + curInt
            cur = str.index(after: cur)
        }
        
        return sign * rs
    }
}


Solution1().myAtoi("")

//: [Previous](@previous) | [Next](@next)
