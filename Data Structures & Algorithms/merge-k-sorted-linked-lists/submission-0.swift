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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var left = 0
        var right = lists.count - 1
        var lists = lists
        while right > 0 {
            left = 0

            while left < right {
                lists[left] = mergeTwoLists(lists[left], lists[right])
                left += 1
                right -= 1
            }
        }
        return lists[0]
    }

    func mergeTwoLists(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        var n1: ListNode? = node1
        var n2: ListNode? = node2

        var dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode

        while n1 != nil, n2 != nil {
            if n1!.val <= n2!.val {
                currentNode?.next = n1
                n1 = n1?.next
            } else {
                currentNode?.next = n2
                n2 = n2?.next
            }
            currentNode = currentNode?.next
        }
        currentNode?.next = n1 == nil ? n2 : n1
        return dummyNode.next
    }
}
