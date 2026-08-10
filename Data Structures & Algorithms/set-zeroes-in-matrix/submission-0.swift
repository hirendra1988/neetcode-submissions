class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var hasFirstRowZero = false
        var hasFirstColZero = false

        for i in 0..<rows {
            if matrix[i][0] == 0 {
                hasFirstColZero = true
                break
            }       
        }

        for j in 0..<cols {
            if matrix[0][j] == 0 {
                hasFirstRowZero = true
                break
            }       
        }

        for i in 1..<rows {
            for j in 1..<cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }

        for i in 1..<rows {
            for j in 1..<cols {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }

        if hasFirstRowZero {
            for j in 0..<cols {
                matrix[0][j] = 0
            }
        }

        if hasFirstColZero {
            for i in 0..<rows {
                matrix[i][0] = 0
            }
        }
    }
}
