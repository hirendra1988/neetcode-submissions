/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil {
            return nil
        }
        return bfs(node)
    }

    func bfs(_ node: Node?) -> Node? {
        var queue = [Node]()
        queue.append(node!)

        var hashMap = [ObjectIdentifier: Node]()
        hashMap[ObjectIdentifier(node!)] = Node(node!.val)

        while !queue.isEmpty {
            let curNode = queue.removeFirst()
            for n in curNode.neighbors {
                if hashMap[ObjectIdentifier(n!)] == nil {
                    queue.append(n!)
                    hashMap[ObjectIdentifier(n!)] = Node(n!.val)
                }
                hashMap[ObjectIdentifier(curNode)]?.neighbors.append(hashMap[ObjectIdentifier(n!)])
            }
        }
        return hashMap[ObjectIdentifier(node!)]
    }
}
