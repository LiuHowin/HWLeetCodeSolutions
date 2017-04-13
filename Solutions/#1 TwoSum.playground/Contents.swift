//: Playground - noun: a place where people can play

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

