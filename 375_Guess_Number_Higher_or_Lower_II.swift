/// Main Idea:
/// For each guess
/// 1) Get the worse case of every choice to guarantee the result
/// 2) Get the least cost among the guaranteed results
class Solution {
    func getMoneyAmount(_ n: Int) -> Int {
        var table = [[Int]](repeatElement([Int](repeatElement(0, count: n + 1)), count: n + 1))
        return DP(&table, 1, n)
    }
    
    func DP(_ table: inout [[Int]], _ s: Int, _ e: Int) -> Int {
        if s >= e {
            return 0
        }
        if table[s][e] != 0 {
            return table[s][e]
        }
        var guarantee = Int.max
        for i in s ..< e + 1 {
            // To get the worse case of every choice to guarantee the result
            let tmp = i + max(DP(&table, s, i - 1), DP(&table, i + 1, e))
            // To get the least cost among the guaranteed results
            guarantee = min(guarantee, tmp)
        }
        table[s][e] = guarantee
        return guarantee
    }
}
