class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var result = 0
        let n = heights.count
        for i in 0..<n {
            var left = i
            while left > 0, heights[left - 1] >= heights[i] {
                left -= 1
            }

            var right = i
            while right < n-1, heights[right + 1] >= heights[i] {
                right += 1
            }

            let window = right - left + 1
            result = max(result, window * heights[i])
        }
        return result
    }
}
