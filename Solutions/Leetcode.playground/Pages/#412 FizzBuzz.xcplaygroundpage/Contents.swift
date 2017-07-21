
/**
 Write a program that outputs the string representation of numbers from 1 to n.
 
 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
 Example:
 
 n = 15,
 
 Return:
 [
 "1",
 "2",
 "Fizz",
 "4",
 "Buzz",
 "Fizz",
 "7",
 "8",
 "Fizz",
 "Buzz",
 "11",
 "Fizz",
 "13",
 "14",
 "FizzBuzz"
 ]
 */

// 普通解法
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var results: [String] = []
        
        for i in 1...n {
            if i % 15 == 0 {
                results.append("FizzBuzz")
            } else if i % 3 == 0 {
                results.append("Fizz")
            } else if i % 5 == 0 {
                results.append("Buzz")
            } else {
                results.append(String(i))
            }
        }
        return results
    }
}

// 稍微优化解法：只有四种可能，而且规律也是一定的，按照规律，每次遇到FizzBuzz后 FizzBuzz+15 但是不要忘了Fizz和Buzz都改变，每次遇到Fizz后 Fizz+3，按照规律每次遇到Buzz后 Buzz+5。
class Solution1 {
    func fizzBuzz(_ n: Int) -> [String] {
        var results: [String] = []
        var Fizz = 3
        var Buzz = 5
        var FizzBuzz = 15
        
        for i in 1...n {
            if i == FizzBuzz {
                results.append("FizzBuzz")
                Fizz = FizzBuzz + 3
                Buzz = FizzBuzz + 5
                FizzBuzz += 15
            } else if i == Fizz {
                results.append("Fizz")
                Fizz += 3
            } else if i == Buzz {
                results.append("Buzz")
                Buzz += 5
            } else {
                results.append(String(i))
            }
        }
        return results
    }
}

Solution1().fizzBuzz(30)


