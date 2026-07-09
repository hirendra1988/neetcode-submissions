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
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head?.next
        var fast: ListNode? = head?.next?.next

        while slow !== fast {
            slow = slow?.next
            fast = fast?.next?.next

            if fast === slow {
                slow = head
                while fast !== slow {
                    slow = slow?.next
                    fast = fast?.next
                }
                break
            }
        }
        return slow != nil
    }
}
