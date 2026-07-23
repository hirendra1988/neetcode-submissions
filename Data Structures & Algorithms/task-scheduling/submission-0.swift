class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var hashMap = [Character: Int]()
        var maxFreq = 0
        for task in tasks {
            hashMap[task, default: 0] += 1
            maxFreq = max(maxFreq, hashMap[task, default: 0])
        }
        var maxFreqCount = 0
        for (key, value) in hashMap {
            if maxFreq == value {
                maxFreqCount += 1
            }
        }
        let idleTime = (maxFreq-1) * (n+1) + maxFreqCount
        return max(idleTime, tasks.count)
    }
}
