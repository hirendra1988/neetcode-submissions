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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return lcaHelper(root, p, q)
    }

    func lcaHelper(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q, let root = root else {
            return nil
        }
        if p.val <= root.val && q.val >= root.val {
            return root
        }
        if p.val < root.val && q.val < root.val {
            return lcaHelper(root.left, p, q)
        } 
        if p.val > root.val && q.val > root.val {
            return lcaHelper(root.right, p, q)
        } 
        return root
    }
}
