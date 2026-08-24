class Solution {
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var mid = 0
        var right = nums.count - 1
        while mid <= right {
            if nums[mid] == 0 {
                swap(left, mid, &nums)
                left += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                swap(mid, right, &nums)
                right -= 1
            }
        }
    }

    func swap(_ start: Int, _ end: Int, _ nums: inout [Int]) {
        let temp = nums[start]
        nums[start] = nums[end]
        nums[end] = temp
    }
}
