class Solution {
    class Node {
        var children = [Character: Node]()
        var word: String?
    }

    var root = Node()

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty {
            return []
        }
        for word in words {
            addWord(word)
        }
        var result = [String]()
        let rows = board.count
        let cols = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        for row in 0..<rows {
            for col in 0..<cols {
                dfs(board, row, col, &visited, root, &result)
            }
        }
        return result
    }

    func dfs(_ board: [[Character]],
             _ row: Int,
             _ col: Int,
             _ visited: inout [[Bool]],
             _ node: Node,
             _ result: inout [String]) {
        let rows = board.count
        let cols = board[0].count

        if row < 0 || row >= rows || col < 0 || col >= cols || visited[row][col] {
            return
        }
        guard let currentNode = node.children[board[row][col]] else {
            return
        }
        if let word = currentNode.word {
            result.append(word)
            currentNode.word = nil
        }
        visited[row][col] = true
        dfs(board, row+1, col, &visited, currentNode, &result)
        dfs(board, row-1, col, &visited, currentNode, &result)
        dfs(board, row, col+1, &visited, currentNode, &result)
        dfs(board, row, col-1, &visited, currentNode, &result)
        visited[row][col] = false
    }

    func addWord(_ word: String) {
        var current = root
        for ch in word {
            if current.children[ch] == nil {
                current.children[ch] = Node()
            }
            current = current.children[ch]!
        }
        current.word = word
    }
}
