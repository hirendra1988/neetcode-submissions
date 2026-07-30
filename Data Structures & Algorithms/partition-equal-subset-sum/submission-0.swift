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
        return canPartitionHelper(nums, nums.count, target)
    }

    func canPartitionHelper(_ nums: [Int], _ n: Int, _ target: Int) -> Bool {
        if target == 0 {
            return true
        }
        if target < 0 || n == 0 {
            return false
        }
        
        return canPartitionHelper(nums, n-1, target - nums[n-1]) || canPartitionHelper(nums, n-1, target)
        
    }
}
