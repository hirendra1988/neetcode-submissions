class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 1, count: n)
        var maxLength = Int.min
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j]+1)
                }
            }
            maxLength = max(maxLength, dp[i])
        }
        return maxLength
    }
}
