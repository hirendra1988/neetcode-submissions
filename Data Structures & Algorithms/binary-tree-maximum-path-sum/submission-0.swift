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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        maxPathSumHelper(root, &result)
        return result
    }

    func maxPathSumHelper(_ root: TreeNode?, _ result: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let left = max(maxPathSumHelper(root.left, &result), 0)
        let right = max(maxPathSumHelper(root.right, &result), 0)
        result = max(result, left + right + root.val)
        return max(left, right) + root.val
    }
}
