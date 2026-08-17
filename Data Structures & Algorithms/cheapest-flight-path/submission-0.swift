class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var dist = [Int](repeating: Int.max, count: n)
        dist[src] = 0
        for _ in 0..<k+1 {
            var temp = dist
            for flight in flights {
                let u = flight[0]
                let v = flight[1]
                let weight = flight[2]

                if dist[u] != Int.max && ((dist[u] + weight) < temp[v]) {
                    temp[v] = dist[u] + weight
                }
            }
            dist = temp
        }
        return dist[dst] == Int.max ? -1 : dist[dst]
    }
}
