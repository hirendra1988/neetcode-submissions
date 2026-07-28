class Solution {
   func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid
        var maxArea = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    var count = 0
                    dfs(&grid, row, col, &count)
                    maxArea = max(maxArea, count)
                }
            }
        }
        return maxArea
    }

    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int, _ count: inout Int) {
        let rows = grid.count
        let cols = grid[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == 0 {
            return
        }
        grid[row][col] = 0
        count += 1
        dfs(&grid, row+1, col, &count)
        dfs(&grid, row-1, col, &count)
        dfs(&grid, row, col+1, &count)
        dfs(&grid, row, col-1, &count)
    }
}
