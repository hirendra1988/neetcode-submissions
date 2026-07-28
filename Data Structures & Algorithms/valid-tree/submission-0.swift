class Solution {
    var parent = [Int]()

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n-1 {
            return false
        }
        parent = Array(0..<n)
        var rank = [Int](repeating: 0, count: n)
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let x = find(u)
            let y = find(v)
            if x == y {
                return false
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
        return true
    }

    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = find(parent[x])
        return parent[x]
    }
}
