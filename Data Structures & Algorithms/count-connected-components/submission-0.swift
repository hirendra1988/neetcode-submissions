class Solution {
     func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [[Int]](repeating: [], count: n)
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            addUGraph(u, v, &graph)
        }

        var visited = [Bool](repeating: false, count: n)
        var result = 0
        for i in 0..<n {
            if !visited[i] {
                dfs(&visited, i, graph)
                result += 1
            }
        }
        return result
    }

    func dfs(_ visited: inout [Bool], _ parent: Int, _ graph: [[Int]]) {
        visited[parent] = true
        for u in graph[parent] {
            if !visited[u] {
                dfs(&visited, u, graph)
            }
        }
    }

    func addUGraph(_ u: Int, _ v: Int, _ graph: inout [[Int]]) {
        graph[u].append(v)
        graph[v].append(u)
    }
}
