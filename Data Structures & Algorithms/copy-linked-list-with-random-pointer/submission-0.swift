/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var dummyNode = Node(0)
        var currentNode: Node? = dummyNode
        var n: Node? = head
        var hashMap = [ObjectIdentifier: Node]()
        while n != nil {
            let newNode = Node(n!.val)
            hashMap[ObjectIdentifier(n!)] = newNode

            currentNode?.next = newNode
            currentNode = currentNode?.next

            n = n?.next
        }
        n = head
        currentNode = dummyNode.next
        while n != nil {
            if let random = n?.random {
                currentNode?.random = hashMap[ObjectIdentifier(random)]
            }
            currentNode = currentNode?.next
            n = n?.next
        }
        return dummyNode.next
    }
}
