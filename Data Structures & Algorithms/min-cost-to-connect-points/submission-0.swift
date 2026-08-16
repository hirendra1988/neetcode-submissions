class Solution {
    class Node {
        var vertex: Int
        var weight: Int
        init(_ vertex: Int, _ weight: Int) {
            self.vertex = vertex
            self.weight = weight
        }
    }

    // Prim's Algo
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var adj = [[Node]](repeating: [Node](), count: n)
        for i in 0..<points.count {
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in i+1..<points.count {
                let x2 = points[j][0]
                let y2 = points[j][1]
                let weight = abs(x1-x2) + abs(y1-y2)
                addDEdge(i, j, weight, &adj)
            }
        }
        var block = [Bool](repeating: false, count: n)
        var keys = [Int](repeating: Int.max, count: n)
        keys[0] = 0
        var result = 0
        for i in 0..<n {
            var vertex = -1
            for j in 0..<n {
                if !block[j] && (vertex == -1 || keys[j] < keys[vertex]) {
                    vertex = j
                }
            }
            if vertex == -1 {
                break
            }
            result += keys[vertex]
            block[vertex] = true

            for node in adj[vertex] {
                if !block[node.vertex] && (node.weight < keys[node.vertex]) {
                    keys[node.vertex] = node.weight
                }
            }
        }
        return result
    }

    func addDEdge(_ u: Int, _ v: Int, _ weight: Int, _ adj: inout [[Node]]) {
        adj[u].append(Node(v, weight))
        adj[v].append(Node(u, weight))
    }
}