class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var currentSum = 0
        var left = 0
        var result = Int.max
        for right in 0..<nums.count {
            currentSum += nums[right]
            while currentSum >= target {
                let window = right - left + 1
                result = min(result, window)
                currentSum -= nums[left]
                left += 1
            }
        }
        return result == Int.max ? 0 : result
    }
}
