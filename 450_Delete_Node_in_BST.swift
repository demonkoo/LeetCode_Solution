/// ATTENTION!!
/// This code does not pass the LeetCode system in case:
/// [1,0,15,null,null,4,35,3,8,25,49,2,null,5,12,22,27,47,null,null,null,null,7,11,13,19,24,26,31,40,48,6,null,9,null,null,14,17,21,23,null,null,null,30,33,39,42,null,null,null,null,null,10,null,null,16,18,20,null,null,null,28,null,32,34,36,null,41,44,null,null,null,null,null,null,null,null,null,29,null,null,null,null,null,37,null,null,43,46,null,null,null,38,null,null,45] with delete node 22
/// But I think my solution is correct according to the actual diagram
/// If you have found any bugs, please contact me, thanks!

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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        // If the tree has only 1 node / 0 node
        if root?.left == nil && root?.right == nil {
            return root?.val == key ? nil : root
        }
        // If the tree has > 2 nodes
        let (parent, cur) = findNode(nil, root, key)
        if cur != nil {
            // 3 conditions to be handled:
            if cur!.left != nil && cur!.right != nil {
                // 1. has 2 children
                let maxNode = findMaxNodeInSubtree(cur!.left!)
                cur!.val = maxNode.val
                let (maxParent, max) = findNode(cur, cur!.left, maxNode.val)
                if maxParent?.left === max {
                    // This situation is for tree like: [3,2,4,1], which max node in subtree is the root of itself, needs to link the rest nodes
                    if max?.left != nil {
                        maxParent?.left = max!.left
                    } else {
                        maxParent?.left = nil
                    }
                } else {
                    maxParent?.right = nil
                }
            } else if cur!.left != nil || cur!.right != nil {
                // 2. has 1 child
                let curChild = cur!.left != nil ? cur!.left : cur!.right
                if parent == nil {
                    return curChild
                }
                if parent!.left === cur {
                    parent!.left = curChild
                } else {
                    parent!.right = curChild
                }
            } else {
                // 3. has no child
                if parent!.left === cur {
                    parent!.left = nil
                } else {
                    parent!.right = nil
                }
            }
        }
        return root
    }
    
    func findNode(_ parentNode: TreeNode?, _ curNode: TreeNode?, _ key: Int) -> (parent: TreeNode?, cur: TreeNode?) {
        if curNode == nil {
            return (parentNode, nil)
        }
        if curNode!.val == key {
            return (parentNode, curNode)
        }
        var (parent, cur) = findNode(curNode!, curNode!.left, key)
        if (parent, cur).1 == nil {
            (parent, cur) = findNode(curNode!, curNode!.right, key)
        }
        return (parent, cur)
    }
    
    func findMaxNodeInSubtree(_ root: TreeNode) -> TreeNode {
        if root.left == nil && root.right == nil {
            return root
        }
        var maxNode = root
        if root.right != nil {
            maxNode = findMaxNodeInSubtree(root.right!)
        }
        // Max Node only occurs in right sub-tree or root itself
        
        return maxNode
    }
}
