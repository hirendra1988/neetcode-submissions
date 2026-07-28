class Solution {
     func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var result = 0
        var grid = grid
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)

        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "1" {
                    dfs(&grid, row, col)
                    result += 1
                }
            }
        }
        return result
    }

    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        let rows = grid.count
        let cols = grid[0].count

        if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == "0" {
            return
        }
        grid[row][col] = "0"
        dfs(&grid, row+1, col)
        dfs(&grid, row-1, col)
        dfs(&grid, row, col+1)
        dfs(&grid, row, col-1)
    }
}
