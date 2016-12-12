/// Main Idea:
/// 1. Preorder Traversal indicate every root of the sub-tree
/// 2. Then we can find the corresponding node in inorder traversal, and divide the list into two parts, left for left sub-tree, right for right sub-tree
/// 3. Then we can divide the preorder traversal list into 2 parts according to the 2 parts length above
/// 4. Do the above steps recursively to the left and right parts
/// Recommand Reading: http://blog.csdn.net/linhuanmars/article/details/24389549
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inHashMap = Dictionary<Int, Int>()
        // Create a hash map for inorder traversal list, otherwise we need to traverse will every time to find the corresponding node
        for i in 0 ..< inorder.count {
            inHashMap[inorder[i]] = i
        }
        return build(preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1, inHashMap)
    }
    
    func build(_ preorder: [Int], _ inorder:[Int], _ preL: Int, _ preR: Int, _ inL: Int, _ inR: Int, _ inHashMap: Dictionary<Int, Int>) -> TreeNode? {
        // Because preL will increase by 1 every time, if finally we get preL > preR, means there's no node in this sub-list
        if preL > preR {
            return nil
        }
        
        let root = TreeNode(preorder[preL])
        let rootIndex = inHashMap[preorder[preL]]!
        
        root.left = build(preorder, inorder, preL + 1, preL + rootIndex - inL, inL, rootIndex - 1, inHashMap)
        root.right = build(preorder, inorder, preL + rootIndex - inL + 1, preR, rootIndex + 1, inR, inHashMap)
        
        return root
    }
}
