class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var newInterval = newInterval
        for i in 0..<intervals.count {
            let interval = intervals[i]
            if newInterval.isEmpty || interval[1] < newInterval[0] {
                result.append(interval)
            } else if interval[0] > newInterval[1] {
                result.append(newInterval)
                result.append(interval)
                newInterval = []
            } else {
                newInterval[0] = min(newInterval[0], interval[0])
                newInterval[1] = max(newInterval[1], interval[1])
            }
        }
        if !newInterval.isEmpty {
            result.append(newInterval)
        }
        return result
    }
}
