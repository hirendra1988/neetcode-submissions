class Solution {
    func reverse(_ x: Int) -> Int {
        var n = x
        var result = 0
        let minVal = Int32.min
        let maxVal = Int32.max
        var carry = 0
        while n != 0 {
            carry = n % 10
            if (result > maxVal/10) || ((result == maxVal/10) && (carry > maxVal % 10)) {
                return 0
            }
            if (result < minVal/10) || ((result == minVal/10) && (carry < minVal % 10)) {
                return 0
            }
            result = result * 10 + carry
            n = n / 10
        }
        return result
    }
}
