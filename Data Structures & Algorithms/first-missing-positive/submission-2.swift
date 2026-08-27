class Solution {
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        let n = nums.count
       
        for i in 0..<n {
            var current = nums[i]
            var currentIndex = current - 1
            while current > 0 && current <= n, nums[i] != nums[currentIndex] {
                let temp = nums[i]
                nums[i] = nums[currentIndex]
                nums[currentIndex] = temp

                current = nums[i]
                currentIndex = current - 1
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
