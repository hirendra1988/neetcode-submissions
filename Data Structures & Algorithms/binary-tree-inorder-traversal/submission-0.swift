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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        _ = inorder(&result, root)
        return result
    }

    func inorder(_ result: inout [Int], _ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(&result, root.left)
        result.append(root.val)
        inorder(&result, root.right)
    }
}
