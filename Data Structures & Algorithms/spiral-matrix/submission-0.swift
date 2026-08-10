class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        let rows = matrix.count
        let cols = matrix[0].count
        var rowBegin = 0
        var rowEnd = rows - 1
        var colBegin = 0
        var colEnd = cols - 1

        while rowBegin <= rowEnd, colBegin <= colEnd {
            for col in colBegin...colEnd {
                result.append(matrix[rowBegin][col])
            }

            for row in rowBegin+1..<rowEnd+1 {
                result.append(matrix[row][colEnd])
            }

            if rowBegin >= rowEnd || colBegin >= colEnd {
                break
            }

            for col in stride(from: colEnd-1, through: colBegin, by: -1) {
                result.append(matrix[rowEnd][col])
            }

            for row in stride(from: rowEnd - 1, through: rowBegin+1, by: -1) {
                result.append(matrix[row][colBegin])
            }
            rowBegin += 1
            colBegin += 1
            rowEnd -= 1
            colEnd -= 1
        }
        return result
    }
}
