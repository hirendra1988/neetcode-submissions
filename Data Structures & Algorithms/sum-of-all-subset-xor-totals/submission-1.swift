class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        return backtracking(nums, 0, 0)
    }

    func backtracking(_ nums: [Int], _ xor: Int, _ start: Int) -> Int {
        if start == nums.count {
            return xor
        }
        let pick = backtracking(nums, xor ^ nums[start], start+1)
        let noPick = backtracking(nums, xor, start+1)
        return pick + noPick
    }
}
