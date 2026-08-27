class Solution {
    //https://www.youtube.com/watch?v=McMC744R3SQ
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        let n = nums.count

        // 1. Replace useless numbers
        for i in 0..<n {
            if nums[i] <= 0 || nums[i] > n {
                nums[i] = n + 1
            }
        }

        // 2. Mark numbers that exist
        for i in 0..<n {
            let num = abs(nums[i])
            if num > n {
                continue
            }
            if nums[num-1] > 0 {
                nums[num-1] = -nums[num-1]
            }
        }

        // 3. First positive position = missing number
        for i in 0..<n {
            if nums[i] > 0 {
                return i + 1
            }
        }
        return n + 1
    }
}
