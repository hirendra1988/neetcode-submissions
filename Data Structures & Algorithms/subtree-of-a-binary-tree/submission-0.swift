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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }

        if root == nil || subRoot == nil {
            return false
        }
        if isSubtreeHelper(root, subRoot) {
            return true
        }
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }

    func isSubtreeHelper(_ n1: TreeNode?, _ n2: TreeNode?) -> Bool {
        if n1 == nil && n2 == nil {
            return true
        }
        if n1 == nil || n2 == nil {
            return false
        }
        if n1!.val != n2!.val {
            return false
        }
        return isSubtreeHelper(n1?.left, n2?.left) && isSubtreeHelper(n1?.right, n2?.right)
    }
}
