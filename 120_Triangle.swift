/// Main Idea:
/// Bottom-up DP
/// 1) Start from the nodes on the bottom row
/// 2) The min pathsum at the ith node on the kth row would be the lesser of the pathsums of its two children plus the value of itself
/// Recommand Reading: https://discuss.leetcode.com/topic/1669/dp-solution-for-triangle
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var minLen = triangle.last!
        
        for k in stride(from: triangle.count - 2, to: -1, by: -1) {
            for i in 0 ..< triangle[k].count {
                minLen[i] = min(minLen[i], minLen[i + 1]) + triangle[k][i]
            }
        }
        
        return minLen[0]
    }
}
