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
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        var startTime = intervals.map {$0.start }.sorted()
        var endTime = intervals.map {$0.end }.sorted()

        var start = 0
        var end = 0
        var count = 0
        var res = 0
        while start < startTime.count {
            if startTime[start] < endTime[end] {
                count += 1
                start += 1
            } else {
                count -= 1
                end += 1
            }
            res = max(res, count)
        }
        return res
    }
}
