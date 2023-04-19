import UIKit

/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
 
 Example 1:
 Input: nums = [3,0,1]
 Output: 2
 Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
 
 Example 2:
 Input: nums = [0,1]
 Output: 2
 Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
 
 Example 3:
 Input: nums = [9,6,4,2,3,5,7,0,1]
 Output: 8
 Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
 */

func missingNumber(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count
    var range = start...end
    var arr = Array(range)
    let set1 = Set(arr)
    let set2 = Set(nums)
    let subtr = set1.subtracting(set2)
    let number = subtr.first ?? 0
    return number
}
func missingNumber2(_ nums: [Int]) -> Int {
    var sumOfIndexes = 0
    var sumOfValues = 0
    
    for (i, value) in nums.enumerated() {
        sumOfIndexes += i
        sumOfValues += value
    }
    let diff = sumOfValues - sumOfIndexes
    
    return nums.count - diff
}
func missingNumber3(_ nums: [Int]) -> Int {
    var missingNum = nums.reduce(0, ^)
    print(missingNum)
    return (0...nums.count).reduce(missingNum, ^)
}
