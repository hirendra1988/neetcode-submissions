class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        subsetsHelper(nums, &result, &tempSet, 0)
        return result
    }

    func subsetsHelper(_ nums: [Int], _ result: inout [[Int]], _ tempSet: inout [Int], _ index: Int) {
        result.append(tempSet)
        for i in index..<nums.count {
            tempSet.append(nums[i])
            subsetsHelper(nums, &result, &tempSet, i+1)
            tempSet.removeLast()
        }
    }
}
