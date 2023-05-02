import UIKit

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
          var rhs = root.next else {
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

let list = createLinkedList()
printLinkedList(node: list)
let node = reverseList(list)
printLinkedList(node: node!)

