class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sChars = Array(s)
        var left = 0
        var hashMap = [Character: Int]()
        var result = 0
        for right in 0..<sChars.count {
            if let prevIndex = hashMap[sChars[right]] {
                left = max(left, prevIndex+1)
            }
            result = max(result, right-left+1)
            hashMap[sChars[right], default: 0] = right 
        }
        return result
    }
}
