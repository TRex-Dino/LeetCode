import UIKit

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
longestCommonPrefix(["asd44","asd","3"])

