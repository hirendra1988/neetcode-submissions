class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let rows = s.count
        let cols = t.count
        var dp = [[Int]](repeating: [Int](repeating: -1, count: cols), count: rows)
        return dfs(Array(s), Array(t), 0, 0, &dp)
    }

    func dfs(_ sChars: [Character],
             _ tChars: [Character],
             _ i: Int,
             _ j: Int,
             _ dp: inout [[Int]]) -> Int {
        if j == tChars.count {
            return 1
        }
        if i == sChars.count {
            return 0
        }
        
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        if sChars[i] == tChars[j] {
            dp[i][j] = dfs(sChars, tChars, i+1, j+1, &dp) + dfs(sChars, tChars, i+1, j, &dp)
        } else {
            dp[i][j] = dfs(sChars, tChars, i+1, j, &dp)
        }
        return dp[i][j]
    }
}
