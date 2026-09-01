class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target {
                return true
            }
            if nums[left] == nums[mid], nums[right] == nums[mid] {
                left += 1
                right -= 1
            } else if nums[left] <= nums[mid] {
                if target >= nums[left], target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[right] >= nums[mid] {
                if target >= nums[mid], target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return false
    }
}
