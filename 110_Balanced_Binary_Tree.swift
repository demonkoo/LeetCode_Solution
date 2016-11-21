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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        let leftDepth = getDepth(root!.left, depth: 1)
        let rightDepth = getDepth(root!.right, depth: 1)
        
        // Pay Attention to the definition of Binary Balanced Tree:
        // The depth of `any two subtrees` of every node never differ by more than 1
        // which means such as [5,4,7,3,null,2,null,-1,null,9] is not balanced
        // Thus, needs another recursion to check every node
        return isBalanced(root?.left) && isBalanced(root?.right) && (abs(leftDepth - rightDepth) <= 1)
    }
    
    func getDepth(_ node: TreeNode?, depth: Int) -> Int {
        if node == nil {
            return depth
        }
        
        // If no left/right node, the depth is current depth
        var leftDepth = depth
        var rightDepth = depth
        
        leftDepth = getDepth(node!.left, depth: depth + 1)
        rightDepth = getDepth(node!.right, depth: depth + 1)
        
        // Return the larger depth, which represent the sub-tree height
        return leftDepth > rightDepth ? leftDepth : rightDepth
    }
}
