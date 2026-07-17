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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = 0
        inOrder(root, &count, k, &result)
        return result
    }

    func inOrder(_ root: TreeNode?, _ count: inout Int, _ k: Int, _ result: inout Int) {
        guard let root = root else {
            return 
        }
        inOrder(root.left, &count, k, &result)
        count += 1
        if count == k {
            result = root.val
            return
        }
        inOrder(root.right, &count, k, &result)
    }
}
