class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        var largest = 1
        for i in 0..<rows {
            for j in 0..<cols {
                largest = max(largest, dfs(matrix, i, j, &dp))
            }
        }
        return largest
    }

    func dfs(_ matrix: [[Int]],
            _ row: Int, 
            _ col: Int, 
            _ dp: inout [[Int]]) -> Int {
        if dp[row][col] != 0 {
            return dp[row][col]
        }
        let rows = matrix.count
        let cols = matrix[0].count
        let directions = [[0,1],[0,-1],[1,0],[-1,0]]
        var ans = 1
        for direction in directions {
            let newRow = row + direction[0]
            let newCol = col + direction[1]
            if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols ||
            matrix[newRow][newCol] <= matrix[row][col] {
                continue
            }
            ans = max(ans, 1 + dfs(matrix, newRow, newCol, &dp))
        }
        dp[row][col] = ans
        return ans
    }
}
