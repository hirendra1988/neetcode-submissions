class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var n = nums.count
        for i in 0..<n {
            n = n ^ i ^ nums[i]
        }
        return n
    }
}
