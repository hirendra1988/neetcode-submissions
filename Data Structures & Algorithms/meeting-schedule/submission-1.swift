/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        if intervals.count <= 1 {
            return true
        }
        let sortedIntervals = intervals.sorted { $0.start < $1.start }
        var maxInterval = sortedIntervals[0].end
        for i in 1..<sortedIntervals.count {
            let prevNext = maxInterval
            let curPrev = sortedIntervals[i].start
            if prevNext > curPrev {
                return false
            } else {
                maxInterval = max(maxInterval, sortedIntervals[i].end)
            }
        }
        return true
    }
}
