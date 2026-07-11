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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        var dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode
        var carry = 0

        while n1 != nil || n2 != nil || carry != 0 {
            let addition = (n1?.val ?? 0) + (n2?.val ?? 0) + carry
            carry = addition/10
            let currentVal = addition%10
            
            let newNode = ListNode(currentVal)
            currentNode?.next = newNode
            
            currentNode = currentNode?.next
            n1 = n1?.next
            n2 = n2?.next
        }
        
        return dummyNode.next
    }
}
