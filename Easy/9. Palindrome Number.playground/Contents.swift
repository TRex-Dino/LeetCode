import UIKit

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
