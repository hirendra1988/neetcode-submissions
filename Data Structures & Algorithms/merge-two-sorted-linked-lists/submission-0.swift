/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode

        var n1: ListNode? = list1
        var n2: ListNode? = list2

        while let node1 = n1, let node2 = n2 {
            if node1.val <= node2.val {
                currentNode?.next = n1
                n1 = node1.next
            } else {
                currentNode?.next = n2
                n2 = node2.next
            }
            currentNode = currentNode?.next
        }
        currentNode?.next = n1 == nil ? n2 : n1
        return dummyNode.next
    }
}
