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

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var result = [Int]()

        while !queue.isEmpty {
            let n = queue.count 
            for i in 0..<n {
                let currentNode = queue.removeFirst() 

                if let left = currentNode.left {
                    queue.append(left)
                }
                if let right = currentNode.right {
                    queue.append(right)
                }

                if i == n-1 {
                    result.append(currentNode.val)
                }
            }
        }
        return result
    }
}
