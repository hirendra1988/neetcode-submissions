/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return "null,"
        }
        var str = "\(root!.val),"
        str += serialize(root?.left)
        str += serialize(root?.right)
        return str
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var queue = data.components(separatedBy: ",")
        return deserializeHelper(&queue)
    }

     func deserializeHelper(_ queue: inout [String]) -> TreeNode? {
        let firstNode = queue.removeFirst()
        if firstNode == "null" {
            return nil
        }
        let val = Int(firstNode) ?? 0
        var node = TreeNode(val)
        node.left = deserializeHelper(&queue)
        node.right = deserializeHelper(&queue)
        return node
    }
}
