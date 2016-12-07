/// Main Idea:
/// 1) Find the right-most node 'pre' in left sub-tree
/// 2) Move the right sub-tree to right child of 'pre'
/// 3) Move the left sub-tree to the right
/// Also can use Morris Traversal, but will be a bit complex
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var mRoot = root
        while mRoot != nil {
            if mRoot!.left != nil {
                var pre = mRoot!.left
                // 1) Find the right-most node 'pre' in left sub-tree
                while pre!.right != nil {
                    pre = pre!.right
                }
                // 2) Move the right sub-tree to right child of 'pre'
                pre!.right = mRoot!.right
                // 3) Move the left sub-tree to the right
                mRoot!.right = mRoot!.left
                mRoot!.left = nil
            } else {
                // If no left sub-tree, continue on the right sub-tree
                mRoot = mRoot!.right
            }
        }
    }
}
