class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = heights
        heights.append(0)
        let n = heights.count
        var stack = [Int]()
        var result = 0

        for i in 0..<n {
            while !stack.isEmpty, heights[stack.last!] >= heights[i] {
                let height = heights[stack.removeLast()]
                var width = 0

                if stack.isEmpty {
                    width = i
                } else {
                    width = i - stack.last! - 1
                }
                result = max(result, width * height)
            }
            stack.append(i)
        }
        return result
    }
}
