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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        return traverse(root, curResult: [])
    }
    
    func traverse(_ root: TreeNode?, curResult: [Int]) -> [Int] {
        if root == nil {
            return curResult
        }
        
        var newResult = traverse(root!.left, curResult: curResult)
        newResult.append(root!.val)
        return traverse(root!.right, curResult: newResult)
    }
}
