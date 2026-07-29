class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var prefix = 1
        var suffix = 1
        var result = Int.min

        for i in 0..<nums.count {
            prefix = prefix == 0 ? nums[i] : prefix * nums[i]
            result = max(result, prefix)
        }

        for j in stride(from: nums.count - 1, through: 0, by: -1) {
            suffix = suffix == 0 ? nums[j] : suffix * nums[j]
            result = max(result, suffix)
        }

        return result
    }
}
