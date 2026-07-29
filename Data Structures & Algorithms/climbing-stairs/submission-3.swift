class Solution {
    func climbStairs(_ n: Int) -> Int {
        //Bottom-Up Dynamic Programming
        if n <= 3 {
            return n
        }
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2
        for i in 2..<n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n-1]
    }
}
