class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var maxLength = 0
        var wordSet = Set(wordDict)
        for word in wordSet {
            maxLength = max(maxLength, word.count)
        }
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true

        var sChars = Array(s)
        for i in 1...sChars.count {
            for j in stride(from: i, through: max(i - maxLength, 0), by: -1) {
                let word = String(sChars[j..<i])
                if dp[j], wordSet.contains(word) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
}
