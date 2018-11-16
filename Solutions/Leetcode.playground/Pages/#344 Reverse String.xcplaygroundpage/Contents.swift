//: [Previous](@Previous)
/*:
 Write a function that takes a string as input and returns the string reversed.
 */
//: [Problem link](https://leetcode.com/problems/reverse-string/description/)

// swift中可将Sting拆分成character
class Solution {
    func reverseString(_ s: String) -> String {
        var reverseString = ""
        for character in s.characters {
            reverseString.insert(character, at: reverseString.startIndex)
        }
        return reverseString
    }
}

//: [Next](@next)
