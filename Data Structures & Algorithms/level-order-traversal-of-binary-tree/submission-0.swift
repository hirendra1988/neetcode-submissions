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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var result = [[Int]]()

        while !queue.isEmpty {
            let n = queue.count
            var tempArray = [Int]()
            for i in 0..<n {
                let firstNode = queue.removeFirst()
                tempArray.append(firstNode.val)

                if let left = firstNode.left {
                    queue.append(left)
                }
                if let right = firstNode.right {
                    queue.append(right)
                }
            }
            result.append(tempArray)
        }
        return result
    }
}
