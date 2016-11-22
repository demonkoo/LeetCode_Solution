/// Pay Attention to the create procedure:
/// Cannot create tree first, then fill the nodes
/// Because BST is not guaranteed to have full left leave nodes first
/// Thus, cannot preview the shape of the tree in the beginning

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // Return Condition
        if nums.count == 0 {
            return nil
        } else if nums.count == 1 {
            return TreeNode(nums[0])
        } else if nums.count == 2 {
            let node = TreeNode(nums[1])
            node.left = TreeNode(nums[0])
            return node
        }
        
        // Find the middle number of the sorted array, it's the parent of tree/sub-tree
        // Then, cut the array into 2 halves
        // Do the same procedure recursively
        let midIndex = nums.count / 2
        let midNode = TreeNode(nums[midIndex])
        midNode.left = sortedArrayToBST(Array(nums[0...(midIndex - 1)]))
        midNode.right = sortedArrayToBST(Array(nums[(midIndex + 1)...(nums.count - 1)]))
        
        return midNode
    }
}
