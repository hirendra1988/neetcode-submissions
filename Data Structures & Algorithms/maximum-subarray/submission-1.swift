class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentSum = 0
        var maxSum = Int.min
        for num in nums {
            currentSum = max(num, currentSum + num)
            maxSum = max(maxSum, currentSum)
        }
        return maxSum
    }
}
