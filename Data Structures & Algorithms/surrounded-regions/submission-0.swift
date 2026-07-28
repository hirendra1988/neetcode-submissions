class Solution {
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty {
            return
        }
        let rows = board.count
        let cols = board[0].count

        for row in 0..<rows {
            for col in 0..<cols {
                if row * col == 0 || row == rows - 1 || col == cols - 1 {
                    if board[row][col] == "O" {
                        dfs(&board, row, col)
                    }
                }
            }
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == "A" {
                    board[row][col] = "O"
                } else if board[row][col] == "O" {
                    board[row][col] = "X"
                }
            }
        }

    }

    func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int) {
        let rows = board.count
        let cols = board[0].count

        if row < 0 || row >= rows || col < 0 || col >= cols ||
        board[row][col] != "O" {
            return
        }
        board[row][col] = "A"
        dfs(&board, row+1, col)
        dfs(&board, row-1, col)
        dfs(&board, row, col+1)
        dfs(&board, row, col-1)
    }
}
