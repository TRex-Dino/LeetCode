import UIKit

var greeting = "Hello, playground"
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
