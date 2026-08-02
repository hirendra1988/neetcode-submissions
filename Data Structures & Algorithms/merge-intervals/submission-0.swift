class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        result.append(sorted[0])
        for i in 1..<sorted.count {
            let prevNext = result[result.count-1][1]
            let curPrev = sorted[i][0]
            if prevNext >= curPrev {
                result[result.count-1][0] = min(result[result.count-1][0], sorted[i][0])
                result[result.count-1][1] = max(result[result.count-1][1], sorted[i][1])
            } else {
                result.append(sorted[i])
            }
        }
        return result
    }
}
