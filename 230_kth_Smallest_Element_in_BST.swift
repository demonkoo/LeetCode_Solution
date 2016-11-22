/// If you are interested in detail
/// please see my post about BST: https://demonkoo.github.io/2016/11/09/BST/

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
    var kthSmallest = -1
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root!, 0, k)
        return kthSmallest
    }
    
    func traverse(_ node: TreeNode?, _ curCount: Int, _ k: Int) -> Int {
        // Inorder traverse
        if node == nil {
            return curCount
        }
        
        let leftCount = traverse(node!.left, curCount, k)
        if leftCount + 1 == k {
            kthSmallest = node!.val
        }
        let rightCount = traverse(node!.right, leftCount + 1, k)
        
        return rightCount
    }
}
