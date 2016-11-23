/// This problem is classified to "HARD" according to the implementation of Iterative Version
/// Recursion Version is trivial
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

// Recursion Version

/*
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        return traverse(root, curResult: [])
    }
    
    func traverse(_ root: TreeNode?, curResult: [Int]) -> [Int] {
        if root == nil {
            return curResult
        }
        
        let leftResult = traverse(root!.left, curResult: curResult)
        var rightResult = traverse(root!.right, curResult: leftResult)
        rightResult.append(root!.val)
        return rightResult
    }
}
 */

// Iterative Version

class Stack<T> {
    var items: [T] = []
    func push(_ item: T) -> [T] {
        items.append(item)
        return items
    }
    func pop() -> T {
        return items.remove(at: items.count - 1)
    }
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        let nodeStack = Stack<TreeNode>()
        // Use Stack is much easier to comprehend
        // But needs to pop out again to get the result result array
        var resultArray = [Int]()
        
        guard let validRoot = root else {
            return resultArray
        }
        
        // nodeStack is kind like 'observing' stack
        // if the observing node has children, it will be in the later position in resultArray
        nodeStack.push(validRoot)
        while !nodeStack.isEmpty() {
            let curNode = nodeStack.pop()
            resultArray.insert(curNode.val, at: 0)
            if let leftNode = curNode.left {
                nodeStack.push(leftNode)
            }
            if let rightNode = curNode.right {
                nodeStack.push(rightNode)
            }
        }
        
        return resultArray
    }
}
