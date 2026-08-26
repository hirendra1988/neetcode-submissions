class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0
        var vote = 0
        for num in nums {
            if vote == 0 {
                vote += 1
                candidate = num
            } else if candidate == num {
                vote += 1
            } else {
                vote -= 1
            }
        }
        return candidate
    }
}
