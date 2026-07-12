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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var count = 0
        var n1: ListNode? = head
        while n1 != nil {
            n1 = n1?.next
            count += 1
        }

        if count < k {
            return head
        }

        var pos = 0
        var p1: ListNode? = nil
        var p2: ListNode? = head
        while pos < k {
            let p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
            pos += 1
        }

        if p2 != nil {
            let reverseNode = reverseKGroup(p2, k)
            head?.next = reverseNode
        }
        return p1
    }
}
