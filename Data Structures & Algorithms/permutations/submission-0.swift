class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        permuteHelper(nums, &result, &tempSet)
        return result
    }

    func permuteHelper(_ nums: [Int],
                      _ result: inout [[Int]],
                      _ tempSet: inout [Int]){
        if tempSet.count == nums.count {
            result.append(tempSet)
            return
        }
        for i in 0..<nums.count {
            if tempSet.contains(nums[i]) {
                continue
            }
            tempSet.append(nums[i])
            permuteHelper(nums, &result, &tempSet)
            tempSet.removeLast()
        }
    }
}
