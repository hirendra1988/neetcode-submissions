class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var totalSum = 0
        for num in nums {
            totalSum += num
        }
        if totalSum % 2 != 0 {
            return false
        }
        let target = totalSum/2
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: target + 1),
        count: nums.count + 1)
        return canPartitionHelper(nums, nums.count, target, &memo)
    }

    func canPartitionHelper(_ nums: [Int],
                            _ n: Int, 
                            _ target: Int, 
                            _ memo: inout [[Bool?]]) -> Bool {
        if target == 0 {
            return true
        }
        if target < 0 || n == 0 {
            return false
        }
        if let answer = memo[n][target] {
            return answer
        }
        if nums[n-1] <= target {
            memo[n][target] = canPartitionHelper(nums, n-1, target - nums[n-1], &memo) || canPartitionHelper(nums, n-1, target, &memo)
        } else {
            memo[n][target] = canPartitionHelper(nums, n-1, target, &memo)
        }
        return memo[n][target] ?? false
    }
}
