class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var exponent = abs(n)
        var result = 1.0
        while exponent > 0 {
            if exponent % 2 == 1 {
                result *= base
            }
            base *= base
            exponent /= 2
        }
        return n < 0 ? 1.0/result : result
    }
}
