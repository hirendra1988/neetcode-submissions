class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 {
            return [0]
        }
        var adjList = [[Int]](repeating: [], count: n)
        for edge in edges {
            addUEdge(edge[0], edge[1], &adjList)
        }
        var degree = [Int](repeating: 0, count: n)
        var queue = [Int]()
        for i in 0..<n {
            degree[i] = adjList[i].count
            if adjList[i].count == 1 {
                queue.append(i)
            }
        }
        var remaining = n
        while !queue.isEmpty {
            if remaining <= 2 {
                break
            }
            let count = queue.count 
            for i in 0..<count {
                remaining -= 1
                let curr = queue.removeFirst()
                for neighbour in adjList[curr] {
                    degree[neighbour] -= 1
                    if degree[neighbour] == 1 {
                        queue.append(neighbour)
                    }
                }
            }
        }
        return queue
    }

    func addUEdge(_ u: Int, _ v: Int, _ adjList: inout [[Int]]) {
        adjList[u].append(v)
        adjList[v].append(u)
    }
}
