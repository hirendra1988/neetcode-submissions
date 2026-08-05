class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                dp[i][j] = dfs(matrix, i, j, -1, &dp)
            }
        }
        var largest = 1
        for i in 0..<rows {
            for j in 0..<cols {
                largest = max(largest, dp[i][j])
            }
        }
        return largest
    }

    func dfs(_ matrix: [[Int]], _ row: Int, _ col: Int, _ prev: Int, _ dp: inout [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || matrix[row][col] <= prev {
            return 0
        }
        if dp[row][col] != 0 {
            return dp[row][col]
        }
        var res = 1
        res = max(res, 1 + dfs(matrix, row+1, col, matrix[row][col], &dp))
        res = max(res, 1 + dfs(matrix, row-1, col, matrix[row][col], &dp))
        res = max(res, 1 + dfs(matrix, row, col+1, matrix[row][col], &dp))
        res = max(res, 1 + dfs(matrix, row, col-1, matrix[row][col], &dp))
        dp[row][col] = res
        return dp[row][col] 
    }
}
