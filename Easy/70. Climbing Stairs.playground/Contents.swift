import UIKit

/*
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

func climbStairs(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 1 }
    
    var first = 1
    var second = 1
    var third = 0
    
    for _ in 2...n {
        third = first + second
        first = second
        second = third
    }
    
    return second
}
func climbStairs2(_ n: Int) -> Int {
    if n < 4 { return n }
    var p1 = 1
    var p2 = 2
    for _ in 3...n {
        p2 = p1 + p2
        p1 = p2 - p1
    }
    return p2
}
