class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let rows = m
        let cols = n
        var dp = [[Int]](repeating: [Int](repeating: 1, count: cols), count: rows)
        for i in 1..<rows {
            for j in 1..<cols {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[rows - 1][cols-1]
    }
}
