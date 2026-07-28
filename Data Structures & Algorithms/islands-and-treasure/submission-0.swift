class Solution {
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        var wall = -1
        var gate = 0
        var empty = 2147483647
        let rows = grid.count
        let cols = grid[0].count

        var queue = [(Int, Int)]()
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == gate {
                    queue.append((row, col))
                }
            }
        }

        let directions = [[1,0],[0,1],[-1,0],[0,-1]]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let row = cur.0
            let col = cur.1

            for direction in directions {
                let newRow = row + direction[0]
                let newCol = col + direction[1]

                if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols ||
                grid[newRow][newCol] != empty {
                    continue
                }
                grid[newRow][newCol] = grid[row][col] + 1
                queue.append((newRow, newCol))
            }
        }
    }
}
