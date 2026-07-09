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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var p1: ListNode? = nil
        var p2: ListNode? = head

        while p2 != nil {
            let p3 = p2!.next
            p2!.next = p1
            p1 = p2
            p2 = p3
        }
        return p1
    }
}
