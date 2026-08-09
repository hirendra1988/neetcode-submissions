class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        let n = result.count
        for i in stride(from: n-1, through: 0, by: -1) {
            if digits[i] == 9 {
                result[i] = 0
            } else {
                result[i] += 1
                return result
            }
        }
        result.insert(1, at: 0)
        return result
    }
}
