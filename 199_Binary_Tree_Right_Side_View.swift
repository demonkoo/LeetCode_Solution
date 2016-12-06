/// Need another var to record the current depth
/// Only nodes that is deeper than current can be added to view list
/// In other words, only one node can be chosen from each level
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var viewList = [Int]()
        traverse(root, &viewList, 0)
        return  viewList
    }
    func traverse(_ cur: TreeNode?, _ viewList: inout [Int], _ depth: Int) {
        guard let cur = cur else {
            return
        }
        if depth >= viewList.count {
            viewList.append(cur.val)
        }
        traverse(cur.right, &viewList, depth + 1)
        traverse(cur.left, &viewList, depth + 1)
    }
}
