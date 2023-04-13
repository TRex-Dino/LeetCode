import UIKit

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

extension Collection where Element: Equatable {
    /// Returns the first index where the specified value appears in the collection
    /// - Parameter other: Another collection to search for in the receiving collection
    /// - Returns: The start index where an equal subsequence is found. If the an equal subsequence is not found in the collection, returns `nil`.
    /// - Complexity: O(*n* * *m*) where *n* is the number of elements in the receiving collection and *m* is the number of elements in `other`
    public func firstIndex<C: Collection>(of other: C) -> Index? where C.Element == Element {
        guard !other.isEmpty else {
            return self.startIndex
        }
        
        return self.indices.dropLast(other.count - 1).first(where: {
            zip(self[$0...], other).allSatisfy(==)
        })
    }
}

extension Collection {
    /// Returns the distance from the start index to the given index
    /// - Parameter index: A valid index of the collection. If `index` is equal to the start index, the result is zero.
    /// - Returns: The distance between `startIndex` and `index`
    @inlinable
    public func distanceFromStartIndex(to index: Index) -> Int {
        return self.distance(from: self.startIndex, to: index)
    }
}
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
