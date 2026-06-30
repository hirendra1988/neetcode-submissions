class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var result = 0
        var left = 0
        var right = heights.count - 1
        while left < right {
            if heights[left] < heights[right] {
                result = max(result, heights[left] * (right - left))
                left += 1
            } else {
                result = max(result, heights[right] * (right - left))
                right -= 1
            }
        }
        return result
    }
}
