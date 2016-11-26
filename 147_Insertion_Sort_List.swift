/// 思路：
/// 两条链：原链+新排序链
/// 新链头用dummy node省去麻烦，用一个prev指针记录当前链的最大值位置
/// 按顺序遍历原链，每次都把这个头和prev比较，如果当前头值比prev值大，说明顺序有误，要从头找，然后将当前头插入到prev和prev.next之间
/// 注意插入操作的顺序
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
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(Int.min)
        var prev = dummy
        var mutableHead = head
        
        while mutableHead != nil {
            // let tmp = mutableHead is not correct, because it's a pointer
            let tmp = ListNode(mutableHead!.val)
            
            // prev is the max value of the new list
            // if prev.val > tmp.val, must find the right position for tmp from the begining
            if prev.val > tmp.val {
                prev = dummy
            }
            
            // Find right position
            while prev.next != nil && prev.next!.val <= tmp.val {
                prev = prev.next!
            }
            
            // Insert node
            tmp.next = prev.next
            prev.next = tmp
            mutableHead = mutableHead!.next
        }
        
        return dummy.next
    }
}
