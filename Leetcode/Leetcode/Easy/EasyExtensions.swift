//
//  EasyExtensions.swift
//  Leetcode
//
//  Created by Меньков Д.В. on 28/5/23.
//

import Foundation


// MARK: - 28. Find the Index of the First Occurrence in a String

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
