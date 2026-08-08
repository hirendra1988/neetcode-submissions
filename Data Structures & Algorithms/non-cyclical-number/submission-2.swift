class Solution {
    func isHappy(_ n: Int) -> Bool {
        if n == 1 || n == 7 || n == 10 {
            return true
        }
        if n < 10 {
            return false
        }
        var n = n
        var sum = 0
        while n > 0 {
            let digit = n % 10
            sum += digit * digit
            n = n / 10
        }
        return isHappy(sum)
    }
}
