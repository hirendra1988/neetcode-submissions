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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var pIndex = 0
        return buildTreeHelper(preorder, inorder, &pIndex, 0, inorder.count - 1)
    }

    func buildTreeHelper(_ preorder: [Int], _ inorder: [Int], _ pIndex: inout Int, _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        var node = TreeNode(preorder[pIndex])
        pIndex += 1

        var index = 0
        for i in 0..<inorder.count {
            if inorder[i] == node.val {
                index = i
                break
            }
        }
        
        node.left = buildTreeHelper(preorder, inorder, &pIndex, start, index-1)
        node.right = buildTreeHelper(preorder, inorder, &pIndex, index+1, end)
        return node
    }
}
