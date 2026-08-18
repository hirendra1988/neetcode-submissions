class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var left = 0
        var right = n*n - 1
        while left <= right {
            let mid = (left + right)/2
            if dfs(mid, grid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func dfs(_ waterLevel: Int, _ grid: [[Int]]) -> Bool {
        if grid[0][0] > waterLevel {
            return false
        }
        let n = grid.count
        var queue = [(Int, Int)]()
        queue.append((0,0))
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var directions = [[0,1],[1,0],[0,-1],[-1,0]]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let row = current.0
            let col = current.1
            if row == n-1 && col == n-1 {
                return true
            }
            for direction in directions {
                let newRow = row + direction[0]
                let newCol = col + direction[1]

                if newRow < 0 || newRow >= n || newCol < 0 || newCol >= n ||
                visited[newRow][newCol] || grid[newRow][newCol] > waterLevel {
                    continue
                }
                visited[newRow][newCol] = true
                queue.append((newRow, newCol))
            }
        }
        return false
    }
}