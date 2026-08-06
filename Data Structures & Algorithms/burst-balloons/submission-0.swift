class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        var nums = [1] + nums + [1]
        let left = 1
        let right = nums.count - 2
        var dp = [[Int]](repeating: [Int](repeating: -1, count: nums.count), count: nums.count)
        return dfs(left, right, nums, &dp)
    }

    func dfs(_ left: Int, _ right: Int, _ nums: [Int], _ dp: inout [[Int]]) -> Int {
        if left > right {
            return 0
        }
        if dp[left][right] != -1 {
            return dp[left][right]
        }
        for i in left...right {
            var coins = nums[left-1] * nums[i] * nums[right+1]
            coins += dfs(i+1, right, nums, &dp) + dfs(left, i-1, nums, &dp)
            dp[left][right] = max(dp[left][right], coins)
        }
        return dp[left][right]
    }
}
