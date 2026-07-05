class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target { return mid }
            if nums[left] == target { return left }
            if nums[right] == target { return right }

            if target < nums[mid] {
                left += 1
            } else {
                right -= 1
            }
        }
        return -1
    }
}
