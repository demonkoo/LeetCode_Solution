// Very easy to cause bugs
// Logic is simple: Move the 0s to left side and move the 2s to right side, then the left middle ones are 1s
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var redIndex = 0
        var blueIndex = nums.count - 1
        var curIndex = 0
        
        while curIndex <= blueIndex {
            // First re-arrange blue balls, then red balls
            // Reverse this procedure will cause error
            // 哨兵值问题
            while nums[curIndex] == 2 && curIndex < blueIndex {
                swap(&nums[curIndex], &nums[blueIndex])
                blueIndex -= 1
            }
            while nums[curIndex] == 0 && curIndex > redIndex {
                swap(&nums[curIndex], &nums[redIndex])
                redIndex += 1
            }
            curIndex += 1
        }
    }
}
