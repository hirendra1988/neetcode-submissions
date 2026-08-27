class Solution {
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        let setNums = Set(nums)
        for i in 1...nums.count {
            if !setNums.contains(i) {
                return i
            }
        }
        return nums.count + 1
    }
}
