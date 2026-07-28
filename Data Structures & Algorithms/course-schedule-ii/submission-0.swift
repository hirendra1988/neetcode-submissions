class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        let n = numCourses
        var graph = [[Int]](repeating: [], count: n)
        for prerequisite in prerequisites {
            let u = prerequisite[0]
            let v = prerequisite[1]
            graph[v].append(u)
        }

        var inDegree = [Int](repeating: 0, count: n)
        for adj in graph {
            for i in adj {
                inDegree[i] += 1
            }
        }

        var queue = [Int]()
        for i in 0..<n {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }

        var result = [Int]()

        while !queue.isEmpty {
            var currentCourse = queue.removeFirst()
            result.append(currentCourse)
            for next in graph[currentCourse] {
                inDegree[next] -= 1
                if inDegree[next] == 0 {
                    queue.append(next)
                }
            }
        }
        return result.count == n ? result : []
    }
}
