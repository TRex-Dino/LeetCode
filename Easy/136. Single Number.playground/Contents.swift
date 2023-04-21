import UIKit

/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 
 Example 1:
 Input: nums = [2,2,1]
 Output: 1
 
 Example 2:
 Input: nums = [4,1,2,1,2]
 Output: 4
 
 Example 3:
 Input: nums = [1]
 Output: 1
 */

func singleNumber(_ nums: [Int]) -> Int {
    var dic = [Int: Int]()
    for num in nums {
        if dic[num] != nil {
            dic[num] = nil
        } else {
            dic[num] = 0
        }
    }
    return dic.first?.key ?? 0
}
func singleNumber2(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    
    var result = 0

    for num in nums {
        result ^= num
    }
    return result
}

/*
 Approach
 Here we use the property of XOR operation, that is a^b^b = a.
 So, if we take XOR of all the elements, the duplicated ones will cancel out each other and we will be left with the single element.
 A little theory
 The XOR (exclusive OR) operation is a logical operation that compares two binary digits and returns 1 if they are different and 0 if they are the same. It is represented by the symbol "^".

 The XOR operation has several properties that make it useful in various algorithms and problems. Some of the most important properties of XOR are:

 Commutative: The order of the operands does not affect the result, so a^b = b^a
 Associative: The grouping of the operands does not affect the result, so (a^b)^c = a^(b^c)
 Identity: a^0 = a
 Inverse: a^a = 0
 */
