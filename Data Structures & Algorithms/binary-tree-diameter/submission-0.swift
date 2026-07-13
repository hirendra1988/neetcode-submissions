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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        diameterHelper(root, &diameter)
        return diameter
    }

    func diameterHelper(_ root: TreeNode?, _ diameter: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let left = diameterHelper(root.left, &diameter)
        let right = diameterHelper(root.right, &diameter)
        diameter = max(diameter, left + right)
        return max(left, right) + 1
    }
}
