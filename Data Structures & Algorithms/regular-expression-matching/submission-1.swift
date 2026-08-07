class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp: [[Bool?]] = [[Bool?]](repeating: [Bool?](repeating: nil, count: p.count+1), count: s.count+1)
        return dfs(Array(s), Array(p), 0, 0, &dp)
    }

    func dfs(_ sChars: [Character],
             _ pChars: [Character],
             _ i: Int,
             _ j: Int,
             _ dp: inout [[Bool?]]) -> Bool {
        if dp[i][j] != nil {
            return dp[i][j]!
        }
        if i >= sChars.count && j >= pChars.count {
            return true
        }
        if j >= pChars.count {
            return false
        }
        let match = (i < sChars.count) && (sChars[i] == pChars[j] || pChars[j] == ".")
        if (j+1 < pChars.count) && pChars[j+1] == "*" {
            dp[i][j] = dfs(sChars, pChars, i, j+2, &dp) || // dont use *
                       match && dfs(sChars, pChars, i+1, j, &dp) // use *
        } else if match {
            dp[i][j] = dfs(sChars, pChars, i+1, j+1, &dp)
        } else {
            dp[i][j] = false
        }
        return dp[i][j]!
    }
}
