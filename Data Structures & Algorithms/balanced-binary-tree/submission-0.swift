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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalanced = true
        isBalancedHelper(root, &isBalanced)
        return isBalanced
    }

    func isBalancedHelper(_ root: TreeNode?, _ isBalanced: inout Bool) -> Int {
        guard let root = root else {
            return 0
        }
        let left = isBalancedHelper(root.left, &isBalanced)
        let right = isBalancedHelper(root.right, &isBalanced)
        if abs(left - right) > 1 {
            isBalanced = false
        }
        return max(left, right) + 1
    }
}
