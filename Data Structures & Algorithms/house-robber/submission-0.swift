class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<n {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        return dp[n-1]
    }
}
