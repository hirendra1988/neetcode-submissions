class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        return backtracking(nums, 0, 0)
    }

    func backtracking(_ nums: [Int],
                      _ xor: Int,
                      _ start: Int) -> Int {
        var sum = xor
        for i in start..<nums.count {
            sum += backtracking(nums, xor ^ nums[i], i+1)
        }
        return sum
    }
}
