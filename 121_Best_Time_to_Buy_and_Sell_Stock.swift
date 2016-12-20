/// Main Idea: Kadane's Algorithm
/// If we change the prices array to difference array, this problem will change to a maximum subarray problem, which Kadane's Algorithm is the solution.
/// This subarray is either empty (in which case its sum is zero) or consists of one more element than the maximum subarray ending at the previous position.
/// The algorithm only needs to keep track of the ending position because the implied starting position is just after the last position at which the sum went negative; a higher sum can always be found by dropping any negative-sum prefix.
/// Recommand Reading:
/// 1) https://discuss.leetcode.com/topic/19853/kadane-s-algorithm-since-no-one-has-mentioned-about-this-so-far-in-case-if-interviewer-twists-the-input
/// 2) https://en.wikipedia.org/wiki/Maximum_subarray_problem

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        
        if count <= 1 {
            return 0
        }
        
        var maxDiff = 0
        var maxSoFar = 0
        
        for i in 1 ..< count {
            // Aiming to calculate the largest difference
            maxDiff += prices[i] - prices[i - 1]
            maxDiff = max(0, maxDiff)
            maxSoFar = max(maxSoFar, maxDiff)
        }
        
        return maxSoFar
    }
}
