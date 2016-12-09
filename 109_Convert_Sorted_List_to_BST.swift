/// Main idea:
/// 1. Find the middle node in the list (Use fast & slow pointer)
/// 2. Add the middle node to BST
/// 3. Cut the list into 2 halves, and repeat the above steps to both halves
/// 4. When the sub-list remain no node / 1 node, which means head === tail, stop and return
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        return toBST(head, nil)
    }
    
    func toBST(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
        if head === tail {
            return nil
        }
        var fast = head
        var slow = head
        
        while fast !== tail && fast!.next !== tail {
            fast = fast!.next!.next
            slow = slow!.next
        }
        
        let newNode = TreeNode(slow!.val)
        newNode.left = toBST(head, slow)
        newNode.right = toBST(slow!.next, tail)
        
        return newNode
    }
}
