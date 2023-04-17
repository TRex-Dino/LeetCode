import UIKit

/*
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 You must not use any built-in exponent function or operator.
 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
  

 Example 1:
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 
 Example 2:
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 */

func mySqrt(_ x: Int) -> Int {
    if x == 0 { return 0 }
    if x < 4 { return 1 }
    
    var left = 0
    var right = (x + 1) / 2
    var mid = (left + right) / 2
    
    while left < right {
        if mid * mid > x {
            right = mid - 1
        } else {
            left = mid + 1
        }
        
        mid = (left + right) / 2
    }
    
    return left * left > x ? left - 1 : left
}
func mySqrt2(_ x: Int) -> Int {
    var left = 0
    var right = x
    while left < right {
        let mid = (left + right + 1) / 2
        if mid * mid <= x {
            left = mid
        } else {
            right = mid - 1
        }
    }
    return left
}
