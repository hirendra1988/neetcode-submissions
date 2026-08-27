class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hashMap = [0: 1]
        var sum = 0
        var count = 0
        for i in 0..<nums.count {
            sum += nums[i]
            count += hashMap[sum-k, default: 0]
            hashMap[sum, default: 0] += 1
        }
        return count
    }
}
