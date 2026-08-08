class Solution {
    func isHappy(_ n: Int) -> Bool {
        if n == 1 || n == 7 || n == 10 {
            return true
        }
        if n < 10 {
            return false
        }
        var n = n
        var multi = 0
        while n > 0 {
            let val = n % 10
            multi += val * val
            n = n / 10
        }
        return isHappy(multi)
    }
}
