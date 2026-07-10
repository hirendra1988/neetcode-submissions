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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        var first: ListNode? = head
        var second: ListNode? = head
        for _ in 0..<n {
            second = second?.next
        }
        if second == nil {
            head?.val = head?.next?.val ?? 0
            head?.next = head?.next?.next
            return head
        }
        var prevNode: ListNode? = nil
        while second != nil {
            prevNode = first
            first = first?.next
            second = second?.next
        }
        prevNode?.next = first?.next
        return head
    }
}
