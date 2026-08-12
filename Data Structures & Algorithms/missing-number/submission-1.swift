class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        var sum = n * (n+1)/2
        for num in nums {
            sum -= num
        }
        return sum
    }
}
