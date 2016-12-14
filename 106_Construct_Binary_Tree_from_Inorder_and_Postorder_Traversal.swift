/// Similar idea to 105. Contrust Binary Tree from Preorder and Inorder Traversal
/// Reversed Postorder tells the sub-tree root from right to left
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inHashMap = Dictionary<Int, Int>()
        for i in 0 ..< inorder.count {
            inHashMap[inorder[i]] = i
        }
        return build(postorder.reversed(), inorder, 0, postorder.count - 1, 0, inorder.count - 1, inHashMap)
    }
    
    func build(_ postorder: [Int], _ inorder:[Int], _ postL: Int, _ postR: Int, _ inL: Int, _ inR: Int, _ inHashMap: Dictionary<Int, Int>) -> TreeNode? {
        if postL > postR {
            return nil
        }
        
        let root = TreeNode(postorder[postL])
        let rootIndex = inHashMap[postorder[postL]]!
        
        // Pay attention to 'postL = postR - rootIndex + inL + 1'
        // Not 'postL = postR - rootIndex + inL' 
        // nor 'postL + rootIndex - inL' (rootIndex - inL is right sub-tree length, but need to add after the rootIndex)
        root.left = build(postorder, inorder, postR - rootIndex + inL + 1, postR, inL, rootIndex - 1, inHashMap)
        root.right = build(postorder, inorder, postL + 1, postL + inR - rootIndex, rootIndex + 1, inR, inHashMap)
        
        return root
    }
}
