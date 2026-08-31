class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var shifts = 0
        var left = left
        var right = right
        while left < right {
            left = left >> 1
            right = right >> 1
            shifts += 1
        }
        return left << shifts
    }
}
