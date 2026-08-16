class Solution {
    class Node {
        var vertex: Int
        var weight: Int
        init(_ vertex: Int, _ weight: Int) {
            self.vertex = vertex
            self.weight = weight
        }
    }

    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adj = [[Node]](repeating: [Node](), count: n+1)
        for time in times {
            addDEdge(time[0], time[1], time[2], &adj)
        }
        var block = [Bool](repeating: false, count: n+1)
        var dist = [Int](repeating: Int.max, count: n+1)
        dist[k] = 0
        for _ in 1...n {
            var vertex = -1
            for j in 1...n {
                if !block[j] && ((vertex == -1) || dist[j] < dist[vertex]) {
                    vertex = j
                }
            }
            if vertex == -1 {
                break
            }
            block[vertex] = true
            for node in adj[vertex] {
                if !block[node.vertex] && dist[vertex] != Int.max
                && ((dist[vertex] + node.weight) < dist[node.vertex]) {
                    dist[node.vertex] = dist[vertex] + node.weight
                }
            }
        }
        let maxDelay = dist[1...n].max()!
        return maxDelay == Int.max ? -1 : maxDelay
    }

    func addDEdge(_ u: Int, _ v: Int, _ weight: Int, _ adj: inout [[Node]]) {
        adj[u].append(Node(v, weight))
    }
}
