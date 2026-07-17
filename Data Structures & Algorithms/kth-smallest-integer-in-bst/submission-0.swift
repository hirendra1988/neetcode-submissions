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
        var array = [Int]()
        inOrder(root, &array)
        return array[k-1]
    }

    func inOrder(_ root: TreeNode?, _ array: inout [Int]) {
        guard let root = root else {
            return
        }
        inOrder(root.left, &array)
        array.append(root.val)
        inOrder(root.right, &array)
    }
}
