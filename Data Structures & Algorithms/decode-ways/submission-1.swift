class Solution {
    func numDecodings(_ s: String) -> Int {
        let sChars = Array(s)
        let n = sChars.count
        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = sChars[0] == "0" ? 0 : 1

        if n == 1 {
            return dp[1]
        }

        for i in 2...n {
            if let oneDigit = Int(String(sChars[i-1])), oneDigit >= 1 {
                dp[i] += dp[i-1]
            }
            if let twoDigit = Int(String(sChars[i-2...i-1])), twoDigit >= 10, twoDigit <= 26 {
                dp[i] += dp[i-2]
            }
        }
        return dp[n]
    }
}
