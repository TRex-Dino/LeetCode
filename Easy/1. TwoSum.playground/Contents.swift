import UIKit

/**
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var twoSum = [Int]()
    var test = -1
    var test2 = -1
    
outerloop: for num in nums {
    test += 1
    test2 = -1
    
    for number in nums {
        test2 += 1
        
        if (num + number == target && test != test2){
            twoSum.append(test)
            twoSum.append(test2)
            break outerloop
        }
    }
}
    
    return twoSum
    
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
var dict = [Int: Int]()

for (i, num) in nums.enumerated() {
    print("i", i)
    print("num", num)
    if let index = dict[target-num] {
        print("target, num", target, num)
        print("index", index)
        if i != index {
            return [index, i]
        }
    }
    dict[num] = i
}
return[0]
}
twoSum([1,5,7,9,4,5], 10)
