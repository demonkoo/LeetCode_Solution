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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        guard let head = head else {
            return nil
        }
        
        var fast = head
        var slow = head
        
        // Find the middle node
        while fast.next != nil && fast.next!.next != nil {
            fast = fast.next!.next!
            slow = slow.next!
        }
        
        // Break the list into 2 halves
        fast = slow
        slow = slow.next!
        fast.next = nil
        
        // Sort the first half
        let list1 = sortList(head)
        
        // Sort the second half
        let list2 = sortList(slow)
        
        // Merge the 2 halves
        return mergeTwoHalves(list1, list2)
    }
    
    func mergeTwoHalves(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(Int.min)
        var list1Head = list1
        var list2Head = list2
        
        var tmp = dummy
        while list1Head != nil || list2Head != nil {
            let nodeVar1 = list1Head?.val ?? Int.max
            let nodeVar2 = list2Head?.val ?? Int.max
            
            if nodeVar1 <= nodeVar2 {
                tmp.next = list1Head
                list1Head = list1Head!.next
            } else {
                tmp.next = list2Head
                list2Head = list2Head!.next
            }
            
            tmp = tmp.next!
        }
        return dummy.next
    }
}
