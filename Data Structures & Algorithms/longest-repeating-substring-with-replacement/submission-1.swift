class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let sChars = Array(s)
        var hashMap = [Character: Int]()
        var left = 0
        var maxFreq = 0
        var result = 0
        for right in 0..<sChars.count {
            hashMap[sChars[right], default: 0] += 1
            maxFreq = max(maxFreq, hashMap[sChars[right], default: 0])
            let windowSize = right - left + 1
            if (windowSize - maxFreq) > k {
                 hashMap[sChars[left], default: 0] -= 1
                 left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }
}
