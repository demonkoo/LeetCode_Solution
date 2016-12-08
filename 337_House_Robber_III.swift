/// Main Idea:
/// 2 situations: 1) current node is included & 2) current node is not included
/// 1) If current node indeed inclued, its child can not be included
/// 2) If current node is not included, its child can be either included or not included
/// Reference Reading: 
/// Chinese Version: http://www.cnblogs.com/grandyang/p/5275096.html
/// English Version: https://discuss.leetcode.com/topic/39834/step-by-step-tackling-of-the-problem/4
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
    func rob(_ root: TreeNode?) -> Int {
        let total = calc(root)
        return max(total.0, total.1)
    }
    
    // (Int, Int): $0 - Current Node not included; $1 - Current Node included
    func calc(_ cur: TreeNode?) -> (Int, Int) {
        if cur == nil {
            return (0, 0)
        }
        
        // Current calcalation is base on the sub-calculation
        let left = calc(cur!.left)
        let right = calc(cur!.right)
        var res = (0, 0)
        
        // If current node is not included, its child can be either included or not included
        res.0 = max(left.0, left.1) + max(right.0, right.1)
        // If current node indeed inclued, its child can not be included
        res.1 = left.0 + right.0 + cur!.val
        
        return (res.0, res.1)
    }
}
