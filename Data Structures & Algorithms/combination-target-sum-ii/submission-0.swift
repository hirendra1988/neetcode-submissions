class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        combinationSum2(candidates.sorted(), target, &result, &tempSet, 0, 0)
        return result
    }

    func combinationSum2(_ candidates: [Int],
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
            // Skip duplicates
            if i > index, candidates[i] == candidates[i-1] {
                continue
            }
            let sum = currentSum + candidates[i]
            if sum > target {
                continue
            }
            
            tempSet.append(candidates[i])
            combinationSum2(candidates, target, &result, &tempSet, sum, i+1)
            tempSet.removeLast()
        }
    }
}
