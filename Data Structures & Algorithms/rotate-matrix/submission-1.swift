class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<(n+1)/2 {
            for j in 0..<n/2 {
                // temp of bottomLeft
                let temp = matrix[n-j-1][i]

                // bottomLeft = bottomRight
                matrix[n-j-1][i] = matrix[n-i-1][n-j-1]

                // bottomRight = TopRight
                matrix[n-i-1][n-j-1] = matrix[j][n-i-1]

                // TopRight = TopLeft
                matrix[j][n-i-1] = matrix[i][j]

                // TopLeft = temp
                matrix[i][j] = temp
            }
        }
    }
}
