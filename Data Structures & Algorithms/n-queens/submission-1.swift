class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var board = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)
        helper(n, &board, &result,0)
        return result
    }

    func helper(_ n: Int,
                _ board: inout [[Character]],
                _ result: inout [[String]],
                _ row: Int) {
        if row == n {
            result.append(board.map { String($0)} )
            return
        }
        for col in 0..<n {
            if isValid(row, col, board) {
                board[row][col] = "Q"
                helper(n, &board, &result,row+1)
                board[row][col] = "."
            }
        }
    }

    func isValid(_ row: Int, _ col: Int, _ board: [[Character]]) -> Bool {
        // Check Column
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }

        // Check Upper Left
        var r = row - 1
        var c = col - 1
        while r >= 0, c >= 0 {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c -= 1
        }

        // Check Upper Right
        r = row - 1
        c = col + 1
        while r >= 0 , c < board.count {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c += 1
        }
        return true
    }
}
