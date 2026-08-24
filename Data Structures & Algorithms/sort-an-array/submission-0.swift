class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        var found = false
        for i in 0..<nums.count - 1 {
            for j in 0..<nums.count - i - 1 {
                if nums[j] > nums[j+1] {
                    let temp = nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = temp
                    found = true
                }
            }
            if !found {
                break
            }
        }
        return nums
    }
}
