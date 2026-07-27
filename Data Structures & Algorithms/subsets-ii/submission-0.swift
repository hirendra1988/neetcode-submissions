class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        subsetsWithDupHelper(nums.sorted(), &result, &tempSet, 0)
        return result
    }

    func subsetsWithDupHelper(_ nums: [Int],
                             _ result: inout [[Int]],
                             _ tempSet: inout [Int],
                             _ index: Int) {
        result.append(tempSet)
        for i in index..<nums.count {
            if i > index, nums[i] == nums[i-1] {
                continue
            }
            tempSet.append(nums[i])
            subsetsWithDupHelper(nums, &result, &tempSet, i+1)
            tempSet.removeLast()
        }
    }
}
