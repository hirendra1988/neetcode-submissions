class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count

        var pacificOceanVisited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var atlanticsOceanVisited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)

        //Pacific → Top row + Left column
        //Atlantic → Bottom row + Right column
        for row in 0..<rows {
            dfs(heights, &pacificOceanVisited, row, 0, Int.min) // Left column
            dfs(heights, &atlanticsOceanVisited, row, cols - 1, Int.min) // Right column
        }

        for col in 0..<cols {
            dfs(heights, &pacificOceanVisited, 0, col, Int.min) //  Top row 
            dfs(heights, &atlanticsOceanVisited, rows-1, col, Int.min) // Bottom row
        }

        var result = [[Int]]()

        for row in 0..<rows {
            for col in 0..<cols {
                if pacificOceanVisited[row][col] && atlanticsOceanVisited[row][col] {
                    result.append([row, col])
                }
            }
        }
        return result
    }

    func dfs(_ heights: [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ preHeight: Int) {
        let rows = heights.count
        let cols = heights[0].count

        if row < 0 || row >= rows || col < 0 || col >= cols ||
        visited[row][col] || preHeight > heights[row][col] {
            return
        }
        visited[row][col] = true
        dfs(heights, &visited, row+1, col, heights[row][col])
        dfs(heights, &visited, row-1, col, heights[row][col])
        dfs(heights, &visited, row, col+1, heights[row][col])
        dfs(heights, &visited, row, col-1, heights[row][col])
    }
}
