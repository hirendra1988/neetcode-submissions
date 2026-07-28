class Solution {
    var parent = [Int]()

    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        parent = Array(0...n)
        var rank = [Int](repeating: 0, count: n+1)

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            let x = find(u)
            let y = find(v)

            if x == y {
                return edge
            }
            if rank[x] < rank[y] {
                parent[x] = y
            } else if rank[x] > rank[y] {
                parent[y] = x
            } else {
                parent[x] = y
                rank[y] += 1
            }
        }
        return []
    }

    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = find(parent[x])
        return parent[x]
    }
}
