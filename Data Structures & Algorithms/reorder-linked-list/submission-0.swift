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
    func reorderList(_ head: ListNode?) {
        let right: ListNode? = splitLinkList(head)
        let left: ListNode? = head
        let reverseNode: ListNode? = reverse(right)
        mergeList(left, reverseNode)
    }

    func splitLinkList(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        var prevNode: ListNode? = nil 

        while fast != nil {
            prevNode = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prevNode?.next = nil
        return slow
    }

    func reverse(_ node: ListNode?) -> ListNode? {
        var p1: ListNode? = nil
        var p2: ListNode? = node

        while p2 != nil {
            let p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
        }
        return p1
    }

    func mergeList(_ left: ListNode?, _ right: ListNode?) {
        var n1: ListNode? = left
        var n2: ListNode? = right

        while n1 != nil, n2 != nil {
            let n1Next = n1?.next
            let n2Next = n2?.next

            n1?.next = n2
            if n1Next == nil {
                break
            }
            n2?.next = n1Next

            n1 = n1Next
            n2 = n2Next
        }
    }
}
