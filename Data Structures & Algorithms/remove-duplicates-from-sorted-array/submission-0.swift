class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = 0
        for i in 1..<nums.count {
            if nums[i] != nums[index] {
                index += 1
                nums[index] = nums[i]
            }
        }
        return index + 1
    }
}
