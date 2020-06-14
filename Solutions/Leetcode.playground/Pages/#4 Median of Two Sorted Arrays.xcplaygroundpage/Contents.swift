//: ## Median of Two Sorted Arrays
//: [Problem link](https://leetcode.com/problems/median-of-two-sorted-arrays/#/description)
/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */

// 两个有序的数组，找出两者的的中位数。
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        if n >= m {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        
        
        return 0.1
    }
}


Solution().findMedianSortedArrays([1, 3], [2])

//: [Previous](@previous) | [Next](@next)
