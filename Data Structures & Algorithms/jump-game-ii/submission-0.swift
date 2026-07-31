class Solution {
    func jump(_ nums: [Int]) -> Int {
        var maxPos = 0
        var result = 0
        var end = 0
        for i in 0..<nums.count - 1 {
            maxPos = max(maxPos, i + nums[i])
            if end == i {
                end = maxPos
                result += 1
            }
        }
        return result
    }
}
