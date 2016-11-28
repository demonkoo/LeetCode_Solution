/// Use stack to help the string concatenation
/// Kind like implementing arithmetic

import Foundation

class Solution {
    func decodeString(_ s: String) -> String {
        if s == "" {
            return s
        }
        // 2 stacks:
        // count: to store the repeat counts
        // result: to store the strings
        let count = Stack<Int>()
        let result = Stack<String>()
        
        // Tips about index:
        // index successor: s.characters.index(after: i)
        // index predessor: s.characters.index(before: i)
        var i = s.characters.startIndex
        while i != s.characters.endIndex {
            let ch = s.characters[i]
            if ch >= "0" && ch <= "9" {
                // Get the complete count number
                let start = i
                i = s.characters.index(after: i)
                while s[i] >= "0" && s[i] <= "9" {
                    i = s.characters.index(after: i)
                }
                count.push(Int(s[Range(start ..< i)])!)
                i = s.characters.index(before: i)
            } else if ch == "[" {
                // Must push an empty string to be a split point
                // 2[a]2[ab] v.s 2[a2[ab]]
                result.push("")
            } else if ch == "]" {
                // To build the repeating string
                let curStr = result.pop()!
                let curCount = count.pop()!
                var tmp = 0
                var newStr = ""
                while tmp < curCount {
                    newStr += curStr
                    tmp += 1
                }
                result.push((result.pop() ?? "") + newStr)
            } else {
                // Add current character to current string
                result.push((result.pop() ?? "") + String(ch))
            }
            i = s.characters.index(after: i)
        }
        return result.pop()!
    }
}

class Stack<T> {
    var items: [T] = []
    func push(_ item: T) -> [T] {
        items.append(item)
        return items
    }
    func pop() -> T? {
        return self.isEmpty() ? nil : items.remove(at: items.count - 1)
    }
    func isEmpty() -> Bool {
        return items.count == 0
    }
}
