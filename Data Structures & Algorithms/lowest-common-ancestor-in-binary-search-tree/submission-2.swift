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
        var n1: TreeNode? = root
        while n1 != nil {
            if (p!.val < n1!.val) && (q!.val < n1!.val) {
                n1 = n1?.left
            } else if (p!.val > n1!.val) && (q!.val > n1!.val) {
                n1 = n1?.right
            } else {
                return n1
            }
        }
        return root
    }
}
