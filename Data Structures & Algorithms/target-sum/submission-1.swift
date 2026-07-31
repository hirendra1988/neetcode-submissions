class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var dp = [String: Int]()
        return helper(nums, target, 0, &dp)
    }

    func helper(_ nums: [Int], _ target: Int, _ index: Int, _ dp: inout [String: Int]) -> Int {
        if index >= nums.count {
            return target == 0 ? 1 : 0
        }
        if let cache = dp["\(target)\(index)"] {
            return cache
        }
        let plus = helper(nums, target + nums[index], index+1, &dp)
        let minus = helper(nums, target - nums[index], index+1, &dp)
        dp["\(target)\(index)"] = plus + minus
        return dp["\(target)\(index)"]!
    }
}
