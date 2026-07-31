class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var target = nums.count - 1
        for i in stride(from: nums.count-2, through: 0, by: -1) {
            if (nums[i] + i) >= target {
                target = i
            }
        }
        return target == 0
    }
}
