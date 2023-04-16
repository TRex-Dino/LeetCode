import UIKit

/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.

 Example 1:
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 
 Example 2:
 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 
 Example 3:
 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 */

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    let dCount = digits.count

    var index = dCount - 1
    while index >= 0 {
      if digits[index] < 9 {
        digits[index] += 1
        return digits
      } else {
        digits[index] = 0
        index -= 1
      }
    }
    digits = Array(repeating: 0, count: dCount + 1)
    digits[0] = 1

    return digits
}

func plusOne2(_ digits: [Int]) -> [Int] {
    if digits.isEmpty {
        return [1]
    }
    var newDigits = [Int]()
    var digits = digits
    var lastNumber = 9
    while !digits.isEmpty {
        let digit = digits.removeLast()
        if digit == 9 && lastNumber == 9 {
            newDigits.insert(0, at: 0)
            if digits.isEmpty {
                newDigits.insert(1, at: 0)
            } else {
                lastNumber = 9
            }
        } else if lastNumber == 9 {
            newDigits.insert(digit+1, at: 0)
            lastNumber = -1
        } else {
            newDigits.insert(digit, at: 0)
        }
    }
    return newDigits
}
plusOne2([9,8,7,6,5,4,3,2,1,0])
