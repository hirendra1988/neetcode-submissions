class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var left = 0
        var right = 0
        var nums = nums.sorted()
        for i in 0..<nums.count {
            left = i+1
            right = nums.count - 1
            while left < right {
                let currentSum = nums[i] + nums[left] + nums[right]
                if currentSum == 0 {
                    result.insert([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    continue
                }
                if currentSum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return Array(result)
    }
}
