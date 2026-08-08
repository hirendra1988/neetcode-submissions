class Solution {
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = sumOfSquare(n)
        while slow != fast {
            fast = sumOfSquare(fast)
            fast = sumOfSquare(fast)
            slow = sumOfSquare(slow)
        }
        return fast == 1
    }

    func sumOfSquare(_ n: Int) -> Int {
        var n = n
        var sum = 0
        while n > 0 {
            let digit = n % 10
            sum += digit * digit
            n = n / 10
        }
        return sum
    }
}
