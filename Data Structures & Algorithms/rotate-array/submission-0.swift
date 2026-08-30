class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.isEmpty {
            return
        }
        var k =  k % nums.count
        if k == 0 {
            return
        }
        rotateRight(&nums, 0, nums.count-1)
        rotateRight(&nums, 0, k-1)
        rotateRight(&nums, k, nums.count - 1)
    }

    func rotateRight(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left
        var right = right
        while left < right {
            let temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp
            left += 1
            right -= 1
        }
    }
}