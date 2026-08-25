class NumMatrix {
    //https://www.youtube.com/watch?v=_KASQfRHOws&t=985s
    var prefixSum: [[Int]]

    init(_ matrix: [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        prefixSum = [[Int]](
            repeating: [Int](repeating: 0, count: cols),
            count: rows)
        if rows == 0 || cols == 0 {
            return 
        }
        for i in 0..<rows {
            for j in 0..<cols {
                let top = i <= 0 ? 0 : prefixSum[i-1][j]
                let left = j <= 0 ? 0 : prefixSum[i][j-1]
                let topLeft = (i <= 0 || j <= 0) ? 0 : prefixSum[i-1][j-1]
                prefixSum[i][j] = matrix[i][j] + top + left - topLeft
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let fullBoxSum = prefixSum[row2][col2]
        let topBoxSum = row1 <= 0 ? 0 : prefixSum[row1-1][col2]
        let leftBoxSum = col1 <= 0 ? 0 : prefixSum[row2][col1-1]
        let topLeft = (row1 <= 0 || col1 <= 0) ? 0 : prefixSum[row1-1][col1-1]
        return fullBoxSum - topBoxSum - leftBoxSum + topLeft
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
