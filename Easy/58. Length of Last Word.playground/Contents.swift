import UIKit
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
