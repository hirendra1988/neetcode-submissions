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
    func goodNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var answer = 0
        goodNodesHelper(root, root!.val, &answer)
        return answer
    }

    func goodNodesHelper(_ node: TreeNode?, _ maxSoFar: Int, _ answer: inout Int) {
        guard let node = node else {
            return
        }
        if node.val >= maxSoFar {
            answer += 1
        }
        let maxSoFar = max(maxSoFar, node.val)
        goodNodesHelper(node.left, maxSoFar, &answer)
        goodNodesHelper(node.right, maxSoFar, &answer)
    }

}
