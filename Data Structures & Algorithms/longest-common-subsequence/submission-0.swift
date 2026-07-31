class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let s1 = Array(text1)
        let s2 = Array(text2)
        let rows = s1.count
        let cols = s2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols+1), count: rows+1)

        for i in 1...rows {
            for j in 1...cols {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[rows][cols]
    }
}
