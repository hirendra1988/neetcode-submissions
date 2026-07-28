class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var words = Array(word)
        var board = board

        for row in 0..<rows {
            for col in 0..<cols {
                if words[0] == board[row][col] {
                    if dfs(&board, words, row, col, 0) {
                        return true
                    }
                }
            }
        }
        return false
    }

    func dfs(_ board: inout [[Character]], _ words: [Character], _ row: Int, _ col: Int, _ index: Int) -> Bool {
        if index == words.count {
            return true
        }
        let rows = board.count
        let cols = board[0].count

        if row < 0 || row >= rows || col < 0 || col >= cols ||
        board[row][col] == "." || board[row][col] != words[index] {
            return false
        }
        let nextIndex = index + 1
        let char = board[row][col]
        board[row][col] = "."

        let hasValid = dfs(&board, words, row+1, col, nextIndex) ||
                       dfs(&board, words, row-1, col, nextIndex) ||
                       dfs(&board, words, row, col+1, nextIndex) || 
                       dfs(&board, words, row, col-1, nextIndex)
        board[row][col] = char
        return hasValid
    }
}
