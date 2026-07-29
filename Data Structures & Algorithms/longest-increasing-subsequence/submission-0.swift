class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var stack = [Int]()
        for i in 0..<nums.count {
            if stack.isEmpty || nums[i] > stack.last! {
                stack.append(nums[i])
            } else {
                var left = 0
                var right = stack.count
                while left <= right {
                    let mid = (left + right)/2
                    if stack[mid] >= nums[i] {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
                stack[left] = nums[i]
            }
        }
        return stack.count
    }
}
