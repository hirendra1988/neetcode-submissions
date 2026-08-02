class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var lastPoint = Int.min
        var count = 0
        // [0,0], [1,2]
        for i in 0..<sorted.count {
            if lastPoint > sorted[i][0] {
                count += 1
                lastPoint = min(lastPoint, sorted[i][1])
            } else {
                lastPoint = sorted[i][1]
            }
        }
        return count
    }
}
