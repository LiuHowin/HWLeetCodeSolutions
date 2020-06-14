//: ## Two Sum Add to List
//: [Problem link](https://leetcode.com/problems/two-sum/#/description)
/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 */


// My wrong answer:
//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var preValue = 0
//        var indexs: [Int] = Array()
//        for (index,value) in nums.enumerated() {
//            if index == 0 {
//                preValue = value
//                indexs.append(index)
//            } else {
//                if preValue + value == target {
//                    indexs.append(index)
//                } else if preValue + value > target {
//                    if preValue < value {
//                        indexs.removeAll()
//                        indexs.append(index)
//                        preValue = value
//                    }
//                } else if preValue + value < target {
//                    if preValue > value {
//                        indexs.removeAll()
//                        indexs.append(index)
//                        preValue = value
//                    }
//                }
//            }
//        }
//
//        return indexs
//    }
//}

// 使用hash， 先直接根据value在hash里面找，找不到就先保存，找到就返回。
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash: [Int : Int] = [:]
        var resArray : [Int] = [];
        
        for (i, j) in nums.enumerated() {
            if let index = hash[target - j]{
                resArray.append(index)
                resArray.append(i)
                return resArray
            }
            
            hash[j] = i
        }
        
        return resArray;
    }
}


//: [Previous](@previous) | [Next](@next)
