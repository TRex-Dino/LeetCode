import UIKit

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
