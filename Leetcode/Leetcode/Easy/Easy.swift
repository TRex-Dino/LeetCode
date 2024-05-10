//
//  Easy.swift
//  Leetcode
//
//  Created by Меньков Д.В. on 28/5/23.
//

import Foundation

class Easy {
    
    static func start() {
        let twoSum = ValidPalindrome()

        print(twoSum.isPalindrome("race a car"))
    }
    
    // MARK: - 1. Two Sum
    
    struct TwoSum {
        /*
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
    }
    
    
    // MARK: - 9. Palindrome Number
    
    struct PalindromeNumber {
        /*
         Given an integer x, return true if x is a palindrome, and false otherwise.
         
         Palindrome
         An integer is a palindrome when it reads the same forward and backward.

         For example, 121 is a palindrome while 123 is not.
         */
        func isPalindrome(_ x: Int) -> Bool {
            let stringNumber = String(x)

            return stringNumber == String(stringNumber.reversed())
        }
    }
    
    
    // MARK: - 13. Roman to Integer

    struct RomanToInteger {
        /*
         Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

         Symbol       Value
         I             1
         V             5
         X             10
         L             50
         C             100
         D             500
         M             1000
         For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

         Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

         I can be placed before V (5) and X (10) to make 4 and 9.
         X can be placed before L (50) and C (100) to make 40 and 90.
         C can be placed before D (500) and M (1000) to make 400 and 900.
         Given a roman numeral, convert it to an integer.

         Example 1:

         Input: s = "III"
         Output: 3
         Explanation: III = 3.
         Example 2:

         Input: s = "LVIII"
         Output: 58
         Explanation: L = 50, V= 5, III = 3.
         Example 3:

         Input: s = "MCMXCIV"
         Output: 1994
         Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
         */
        func romanToInt(_ s: String) -> Int {
            let dict: [Character:Int] = [
                "I": 1,
                "V": 5,
                "X": 10,
                "L": 50,
                "C": 100,
                "D": 500,
                "M": 1000
            ]
            
            var prev = 0
            var out = 0
            
            for i in s {
                let val = dict[i] ?? 0
                out += (val <= prev) ? prev : -prev
                
                prev = val
            }
            out += prev
            return out
        }
    }
    
    
    // MARK: - 14. Longest Common Prefix
    
    struct LongestCommonPrefix {
        /*
         Write a function to find the longest common prefix string amongst an array of strings.

         If there is no common prefix, return an empty string "".

          

         Example 1:

         Input: strs = ["flower","flow","flight"]
         Output: "fl"
         Example 2:

         Input: strs = ["dog","racecar","car"]
         Output: ""
         Explanation: There is no common prefix among the input strings.
         */
        func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.isEmpty {
                return ""
            }
            
            var common = strs[0]
            
            for str in strs {
                while !str.hasPrefix(common) {
                    print(common)
                    common = String(common.dropLast())
                }
            }
            return common
        }
    }
    
    // MARK: - 20. Valid Parentheses

    struct ValidParentheses {
        /*
         Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

         An input string is valid if:

         Open brackets must be closed by the same type of brackets.
         Open brackets must be closed in the correct order.
         Every close bracket has a corresponding open bracket of the same type.
          

         Example 1:

         Input: s = "()"
         Output: true
         Example 2:

         Input: s = "()[]{}"
         Output: true
         Example 3:

         Input: s = "(]"
         Output: false

         */
        func isValid(_ s: String) -> Bool {
            var stack = [Character]()
            
            for char in s {
                if char == "(" || char == "[" || char == "{" {
                    stack.append(char)
                } else if char == ")" {
                    guard !stack.isEmpty && stack.removeLast() == "(" else {
                        return false
                    }
                } else if char == "]" {
                    guard !stack.isEmpty && stack.removeLast() == "[" else {
                        return false
                    }
                } else if char == "}" {
                    guard !stack.isEmpty && stack.removeLast() == "{" else {
                        return false
                    }
                }
                print("----", stack)
            }
            
            return stack.isEmpty
        }
    }
    
    // MARK: - 26. Remove Duplicates from Sorted Array
    
    struct RemoveDuplicates {
        /*
         Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

         Consider the number of unique elements of nums be k, to get accepted, you need to do the following things:

         Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
         Return k.
         
         Example 1:

         Input: nums = [1,1,2]
         Output: 2, nums = [1,2,_]
         Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
         It does not matter what you leave beyond the returned k (hence they are underscores).
         Example 2:

         Input: nums = [0,0,1,1,1,2,2,3,3,4]
         Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
         Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
         It does not matter what you leave beyond the returned k (hence they are underscores).
         */

        func removeDuplicates(_ nums: inout [Int]) -> Int {
            var newNums = [Int]()
            var dicNums = [Int: Int]()
            var count = 0
            for num in nums {
                if let _ = dicNums[num] {
                    continue
                } else {
                    dicNums[num] = 0
                    newNums.append(num)
                    count += 1
                }
            }
            nums = newNums
            return count
        }
    }

    
    // MARK: - 27. Remove Element
    
    struct RemoveElement {
        /*
         Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.

         Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:

         Change the array nums such that the first k elements of nums contain the elements which are not equal to val. The remaining elements of nums are not important as well as the size of nums.
         Return k.
         
         Example 1:

         Input: nums = [3,2,2,3], val = 3
         Output: 2, nums = [2,2,_,_]
         Explanation: Your function should return k = 2, with the first two elements of nums being 2.
         It does not matter what you leave beyond the returned k (hence they are underscores).
         Example 2:

         Input: nums = [0,1,2,2,3,0,4,2], val = 2
         Output: 5, nums = [0,1,4,0,3,_,_,_]
         Explanation: Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
         Note that the five elements can be returned in any order.
         It does not matter what you leave beyond the returned k (hence they are underscores).
         */

        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            var count = 0
            var savedIndex = 0
            for (index, num) in nums.enumerated() {
                print(num, index)
                count += 1
                if num == val {
                    count -= 1
                    let newIndex = index + savedIndex
                    nums.remove(at: newIndex)
                    savedIndex -= 1
                }
            }
            
            return count
        }

    }
    
    // MARK: - 28. Find the Index of the First Occurrence in a String

    struct FirstOccurrence {
        /*
         Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

         Example 1:

         Input: haystack = "sadbutsad", needle = "sad"
         Output: 0
         Explanation: "sad" occurs at index 0 and 6.
         The first occurrence is at index 0, so we return 0
         
         Example 2:

         Input: haystack = "leetcode", needle = "leeto"
         Output: -1
         Explanation: "leeto" did not occur in "leetcode", so we return -1.
         */

        
        /// Use Extensions
        func strStr(_ haystack: String, _ needle: String) -> Int {
            guard let index = haystack.firstIndex(of: needle) else {
                return -1
            }
            
            return haystack.distanceFromStartIndex(to: index)
        }

        func strStr2(_ haystack: String, _ needle: String) -> Int {
            let haystack = Array(haystack)
            let needle = Array(needle)
            outer: for i in haystack.indices.dropLast(needle.count-1) {
                for j in needle.indices where haystack[i+j] != needle[j] {
                    continue outer
                }
                return i
            }
            return -1
        }

    }
    
    // MARK: - 35. Search Insert Position

    struct SearchInsertPosition {
        /*
         Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

         You must write an algorithm with O(log n) runtime complexity.

          

         Example 1:

         Input: nums = [1,3,5,6], target = 5
         Output: 2
         Example 2:

         Input: nums = [1,3,5,6], target = 2
         Output: 1
         Example 3:

         Input: nums = [1,3,5,6], target = 7
         Output: 4
         */

        func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            var start = 0
            var end = nums.count

            while start < end {
                let mid: Int = (start + end) / 2

                if nums[mid] < target {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            return start
        }
    }
    
    // MARK: - 58. Length of Last Word

    struct LengthOfLastWord {
        /*
         Given a string s consisting of words and spaces, return the length of the last word in the string.

         A word is a maximal
         substring
          consisting of non-space characters only.
         
         Example 1:
         Input: s = "Hello World"
         Output: 5
         Explanation: The last word is "World" with length 5.
         Example 2:

         Input: s = "   fly me   to   the moon  "
         Output: 4
         Explanation: The last word is "moon" with length 4.
         
         Example 3:
         Input: s = "luffy is still joyboy"
         Output: 6
         Explanation: The last word is "joyboy" with length 6.
         */

        func lengthOfLastWord(_ s: String) -> Int {
            if s.isEmpty {
                return 0
            }
            let arr = s.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
            print(arr)
            if let count = arr.last?.count {
                return count
            }
            return 0
        }
        
        func lengthOfLastWord2(_ s: String) -> Int {
            var count = 0
            
            for char in s.reversed() {
                if char != " " {
                    count += 1
                } else if count > 0 {
                    return count
                }
            }
            
            return count
        }
        
        func lengthOfLastWord3(_ s: String) -> Int {
            if s.isEmpty {
                return 0
            }
            var count = 0
            var newS = s
            while !newS.isEmpty {
                let char = newS.removeLast()
                if char == " " && count < 1 {
                    continue
                } else if char == " " && count > 0 {
                    return count
                } else {
                    count += 1
                }
            }
            return count
        }
    }
    
    // MARK: - 66. Plus One

    struct PlusOne {
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
    }
    
    // MARK: - 69. Sqrt(x)

    struct SqrtX {
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
    }
    
    // MARK: - 70. Climbing Stairs
    
    struct ClimbingStairs {
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
    }

    // MARK: - 83. Remove Duplicates from Sorted List

    struct RemoveDuplicatesFromSortedList {
        /*
         Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
         
         Example 1:
         Input: head = [1,1,2]
         Output: [1,2]
         
         Example 2:
         Input: head = [1,1,2,3,3]
         Output: [1,2,3]
         */
        public class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() {
                self.val = 0
                self.next = nil
            }
            public init(_ val: Int) {
                self.val = val
                self.next = nil
            }
            public init(_ val: Int, _ next: ListNode?) {
                self.val = val
                self.next = next
            }
        }

        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            guard let head else {
                return nil
            }
            var prev = head
            while prev.next != nil {
                if prev.val == prev.next!.val {
                    prev.next = prev.next?.next
                } else {
                    prev = prev.next!
                }
            }
            return head
        }
        func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
            var i = head
            var prev: ListNode?
            while i != nil {
                if i?.val == prev?.val {
                    prev?.next = i?.next
                } else {
                    prev = i
                }
                
                i = i?.next
            }
            
            return head
        }
    }
    
    // MARK: - 88. Merge Sorted Array

    struct MergeSortedArray {
        /*
         You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

         Merge nums1 and nums2 into a single array sorted in non-decreasing order.

         The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

         Example 1:
         Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
         Output: [1,2,2,3,5,6]
         Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
         The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
         
         Example 2:
         Input: nums1 = [1], m = 1, nums2 = [], n = 0
         Output: [1]
         Explanation: The arrays we are merging are [1] and [].
         The result of the merge is [1].
         
         Example 3:
         Input: nums1 = [0], m = 0, nums2 = [1], n = 1
         Output: [1]
         Explanation: The arrays we are merging are [] and [1].
         The result of the merge is [1].
         Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
         */

        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var i = m - 1
            var j = n - 1
            var k = m + n - 1
            
            while i >= 0 && j >= 0 {
                if nums1[i] > nums2[j] {
                    nums1[k] = nums1[i]
                    i -= 1
                } else {
                    nums1[k] = nums2[j]
                    j -= 1
                }
                k -= 1
            }
            
            while j >= 0 {
                nums1[k] = nums2[j]
                j -= 1
                k -= 1
            }
        }
        func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            if nums1.isEmpty && !nums2.isEmpty {
                nums1 = nums2
            } else if !nums2.isEmpty {
                nums1 = nums1[0..<m] + nums2
                nums1.sort()
            }
        }
    }
    
    // MARK: - 121. Best Time to Buy and Sell Stock

    struct BestTimeBuySellStock {
        /*
         You are given an array prices where prices[i] is the price of a given stock on the ith day.

         You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

         Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
         
         Example 1:
         Input: prices = [7,1,5,3,6,4]
         Output: 5
         Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
         Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
         
         Example 2:
         Input: prices = [7,6,4,3,1]
         Output: 0
         Explanation: In this case, no transactions are done and the max profit = 0.
         */

        func maxProfit(_ prices: [Int]) -> Int {
            if prices.isEmpty {
                return 0
            }
            var minPrice = prices[0]
            var result = 0
            
            for price in prices {
                minPrice = min(minPrice, price)
                result = max(result, price - minPrice)
            }
            
            return result
        }
    }

  // MARK: - 125. Valid Palindrome
  struct ValidPalindrome {
    /*
     A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

     Given a string s, return true if it is a palindrome, or false otherwise.



     Example 1:

     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     Example 2:

     Input: s = "race a car"
     Output: false
     Explanation: "raceacar" is not a palindrome.
     Example 3:

     Input: s = " "
     Output: true
     Explanation: s is an empty string "" after removing non-alphanumeric characters.
     Since an empty string reads the same forward and backward, it is a palindrome.
     */

    func isPalindrome(_ s: String) -> Bool {
      guard !s.isEmpty else { return true }

      let lowerCaseString = Array(s.lowercased())
      var start = 0
      var end = s.count-1
      while end >= start {
        if !lowerCaseString[start].isLetter, !lowerCaseString[start].isNumber {
          start += 1
          continue
        }

        if !lowerCaseString[end].isLetter, !lowerCaseString[end].isNumber {
          end -= 1
          continue
        }

        if lowerCaseString[start] == lowerCaseString[end] {
          start += 1
          end -= 1
        } else {
          print("first false")
          return false
        }

      }
      return true
    }
  }

  // MARK: - 136. Single Number

    struct SingleNumber {
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
    }
    
    
    // MARK: - 205. Isomorphic Strings
    
    struct IsomorphicStrings {
        /*
         Given two strings s and t, determine if they are isomorphic.

         Two strings s and t are isomorphic if the characters in s can be replaced to get t.

         All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

         Example 1:
         Input: s = "egg", t = "add"
         Output: true
         
         Example 2:
         Input: s = "foo", t = "bar"
         Output: false
         
         Example 3:
         Input: s = "paper", t = "title"
         Output: true
         */
        func isIsomorphic(_ s: String, _ t: String) -> Bool {
            let first = Array(s)
            let second = Array(t)
            
            guard first.count == second.count  else { return false }
            
            var map = [Character: Character]()
            
            for i in 0..<first.count {
                if !map.keys.contains(first[i]) {
                    if !map.values.contains(second[i]) {
                        map[first[i]] = second[i]
                    } else {
                        return false
                    }
                } else if map[first[i]] != second[i] {
                    return false
                }
            }
            
            return true
        }
    }

    // MARK: - 206. Reverse Linked List

    struct ReverseLinkedList {
        /*
         Given the head of a singly linked list, reverse the list, and return the reversed list.

         Example 1:
         Input: head = [1,2,3,4,5]
         Output: [5,4,3,2,1]
         
         Example 2:
         Input: head = [1,2]
         Output: [2,1]
         
         Example 3:
         Input: head = []
         Output: []
         */
        public class ListNode {
            public var val: Int
            public var next: ListNode?
            
            public init() {
                self.val = 0
                self.next = nil
            }
            
            public init(_ val: Int) {
                self.val = val
                self.next = nil
            }
            
            public init(_ val: Int, _ next: ListNode?) {
                self.val = val
                self.next = next
            }
        }


        func reverseList(_ head: ListNode?) -> ListNode? {
            guard let root = head,
                  let rhs = root.next else {
                return head
            }
            let node = reverseList(rhs)
            rhs.next = root
            root.next = nil
            return node
        }

        func createLinkedList() -> ListNode {
            let nodes: [ListNode] = Array(1...10).map { ListNode($0) }
            let head = ListNode(0)
            var curr = head
            for i in 0..<nodes.count {
                curr.next = nodes[i]
                curr = nodes[i]
            }
            return head
        }

        func printLinkedList(node: ListNode) {
            var curr: ListNode? = node
            var str = ""
            
            while curr != nil {
                str += "\(curr?.val ?? 0) -> "
                curr = curr?.next
            }
            print(String(str.dropLast(4)))
        }
    }
    
    
    // MARK: - 217. Contains Duplicate
    
    struct ContainsDuplicate {
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

    }

    // MARK: - 268. Missing Number

    struct MissingNumber {
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
            let start = 0
            let end = nums.count
            let range = start...end
            let arr = Array(range)
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
            let missingNum = nums.reduce(0, ^)
            print(missingNum)
            return (0...nums.count).reduce(missingNum, ^)
        }
    }
    
    // MARK: - 283. Move Zeroes

    struct MoveZeroes {
        /*
         Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

         Note that you must do this in-place without making a copy of the array.

         Example 1:
         Input: nums = [0,1,0,3,12]
         Output: [1,3,12,0,0]
         
         Example 2:
         Input: nums = [0]
         Output: [0]
         */

        func moveZeroes(_ nums: inout [Int]) {
            var arrayOfZeroes = [Int]()
            var newArray = [Int]()
            for num in nums {
                if num == 0 {
                    arrayOfZeroes.append(num)
                } else {
                    newArray.append(num)
                }
            }
            nums = newArray
            nums.append(contentsOf: arrayOfZeroes)
        }
    }
    
    // MARK: - 448. Find All Numbers Disappeared in an Array

    struct FindAllNumbersDisappeared {
        /*
         Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

         Example 1:
         Input: nums = [4,3,2,7,8,2,3,1]
         Output: [5,6]

         Example 2:
         Input: nums = [1,1]
         Output: [2]
         */

        func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
            var array = [Int]()
            let set = Set(nums)
            for i in 1...nums.count {
                if !set.contains(i){
                    array.append(i)
                }
            }
            return array
        }
    }
}
