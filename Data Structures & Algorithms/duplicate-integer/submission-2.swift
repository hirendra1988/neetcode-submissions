class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var setNums = Set<Int>()
        for num in nums {
            if setNums.contains(num) {
                return true
            }
            setNums.insert(num)
        }
        return false
    }
}
