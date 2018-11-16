//: [Previous](@Previous)
/*:
 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 
 Example 1:
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 
 Note:
 You may use one character in the keyboard more than once.
 You may assume the input string will only contain letters of alphabet.
 */
//: [Problem link](https://leetcode.com/problems/keyboard-row/description/)

// 通过字符的characters集合，和是否为子集合的判断(无序集合)
class Solution {
    func findWords(_ words: [String]) -> [String] {
        let keyboardStr1: Set = Set("qwertyuiop") //
        let keyboardStr2: Set = Set("asdfghjkl")
        let keyboardStr3: Set = Set("zxcvbnm")
        
        var results: [String?] = []
        
        for word in words {
            let set: Set = Set(word.lowercased())
            
            if set.isSubset(of: keyboardStr1) || set.isSubset(of: keyboardStr2) || set.isSubset(of: keyboardStr3) {
                results.append(word)
            }
        }
        
        return results as! [String]
    }
}

Solution().findWords(["Hello", "Alaska", "Dad", "Peace"])


//: [Next](@next)
