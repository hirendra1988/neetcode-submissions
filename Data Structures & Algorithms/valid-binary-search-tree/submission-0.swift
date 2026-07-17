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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTHelper(root, Int.min, Int.max)
    }

    func isValidBSTHelper(_ root: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val <= minVal || root.val >= maxVal {
            return false
        }
        return isValidBSTHelper(root.left, minVal, root.val) && isValidBSTHelper(root.right, root.val, maxVal)
    }
}
