class Solution {
   func orangesRotting(_ grid: [[Int]]) -> Int {
        var empty = 0
        var fresh = 1
        var rotten = 2

        var grid = grid
        let rows = grid.count
        let cols = grid[0].count

        var queue = [(Int, Int)]()
        var freshOranges = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == rotten {
                    queue.append((row, col))
                } else if grid[row][col] == fresh {
                    freshOranges += 1
                }
            }
        }
        if freshOranges == 0 {
            return 0
        }
        var minutes = 0
        let directions = [[1,0],[-1,0],[0,1],[0,-1]]
        while !queue.isEmpty {
            let n = queue.count
            var infected = false
            for i in 0..<n {
                let current = queue.removeFirst()
                let row = current.0
                let col = current.1
                
                for direction in directions {
                    let newRow = row + direction[0]
                    let newCol = col + direction[1]
                    
                    if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols ||
                    grid[newRow][newCol] != fresh {
                        continue
                        }
                        infected = true
                        freshOranges -= 1
                        grid[newRow][newCol] = rotten
                        queue.append((newRow, newCol))
                }
            }
            if infected {
                minutes += 1
            }
        }
        return freshOranges == 0 ? minutes : -1
    }
}
