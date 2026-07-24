class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        combinationSumHelper(candidates, target, &result, &tempSet, 0, 0)
        return result
    }

    func combinationSumHelper(_ candidates: [Int],
                             _ target: Int,
                             _ result: inout [[Int]],
                             _ tempSet: inout [Int],
                             _ currentSum: Int,
                             _ index: Int) {
        if currentSum == target {
            result.append(tempSet)
            return
        }
        for i in index..<candidates.count {
            let sum = currentSum + candidates[i]
            if sum > target {
                continue
            } 
            tempSet.append(candidates[i])
            combinationSumHelper(candidates, target, &result, &tempSet, sum, i)
            tempSet.removeLast()
        }
    }
}
