class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var sChars = Array(s)
        var hashMap = [Character: Int]()
        for i in 0..<sChars.count {
            hashMap[sChars[i], default: 0] = i
        }
        var left = 0
        var right = 0
        var result = [Int]()
        for i in 0..<sChars.count {
            right = max(right, hashMap[sChars[i], default: 0])
            if right == i {
                result.append(right - left + 1)
                left = right + 1
            }
        }
        return result
    }
}
