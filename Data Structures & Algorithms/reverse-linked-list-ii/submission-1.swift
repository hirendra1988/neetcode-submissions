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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left == right {
            return head
        }
        var dummyNode: ListNode? = ListNode(0)
        dummyNode?.next = head

        var prevNode: ListNode? = dummyNode
        for i in 1..<left {
            prevNode = prevNode?.next
        }
        var p1: ListNode? = nil
        var p2: ListNode? = prevNode?.next
        var tail: ListNode? = p2

        for _ in left...right {
            let p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
        }
        prevNode?.next = p1
        tail?.next = p2
        return dummyNode?.next
    }
}
