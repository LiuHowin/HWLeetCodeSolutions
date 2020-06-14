//: ## Reverse String
//: [Problem link](https://leetcode.com/problems/reverse-string/description/)
/*
 Write a function that takes a string as input and returns the string reversed.
 */

class Solution {
    func reverseString(_ s: String) -> String {
        var reverseString = ""
        for (_, character) in s.enumerated() {
            reverseString.insert(character, at: reverseString.startIndex)
        }
        return reverseString
    }
}

//: [Previous](@previous) | [Next](@next)
