class Solution {
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        var nums = nums
        let n = nums.count

        var i = 0
       
        while i  < n {
            let current = nums[i]
            let currentIndex = current - 1
            if current > 0 && current <= n, nums[i] != nums[currentIndex] {
                let temp = nums[i]
                nums[i] = nums[currentIndex]
                nums[currentIndex] = temp
            } else {
                i += 1
            }
        }

        for i in 0..<n {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
}
