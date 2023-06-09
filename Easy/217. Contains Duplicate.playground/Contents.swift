import UIKit

/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: true

 Example 2:
 Input: nums = [1,2,3,4]
 Output: false
 
 Example 3:
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */
func containsDuplicate(_ nums: [Int]) -> Bool {
    var dic = [Int: Int]()
    for num in nums {
        if dic[num] != nil {
            return true
        } else {
            dic[num] = 0
        }
    }
    return false
}
func containsDuplicate2(_ nums: [Int]) -> Bool {
    if nums.isEmpty {
        return false
    }
    var seen = Set<Int>()
    for num in nums {
        if(seen.contains(num)) {
            return true
        } else {
            seen.insert(num)
        }
    }
    
    return false
}
