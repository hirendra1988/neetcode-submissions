class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        var visited = [Bool](repeating: false, count: nums.count)
        permuteHelper(nums, &result, &tempSet, &visited)
        return result
    }

    func permuteHelper(_ nums: [Int],
                      _ result: inout [[Int]],
                      _ tempSet: inout [Int],
                      _ visited: inout [Bool]){
        if tempSet.count == nums.count {
            result.append(tempSet)
            return
        }
        for i in 0..<nums.count {
            if visited[i] {
                continue
            }
            visited[i] = true
            tempSet.append(nums[i])
            permuteHelper(nums, &result, &tempSet, &visited)
            tempSet.removeLast()
            visited[i] = false
        }
    }
}
