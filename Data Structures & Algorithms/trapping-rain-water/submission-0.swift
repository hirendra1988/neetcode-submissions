class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }
        let n = height.count
        var leftMax = [Int](repeating: 0, count: n)
        leftMax[0] = height[0]

        var rightMax = [Int](repeating: 0, count: n)
        rightMax[n-1] = height[n-1]

        for i in 1..<n {
            leftMax[i] = max(leftMax[i-1], height[i])
        }

        for j in stride(from: n-2, through: 0, by: -1) {
            rightMax[j] = max(rightMax[j+1],height[j])
        }

        var result = 0
        for i in 0..<n {
            let minHeight = min(leftMax[i], rightMax[i])
            if minHeight > height[i] {
                result += minHeight - height[i]
            }
        }
        return result
    }
}
