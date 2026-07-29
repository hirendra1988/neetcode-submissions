class Solution {
    var memo = [Int: Int]()

    // Top-Down DP Approach
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 {
            return n
        }
        if let answer = memo[n] {
            return answer
        }
        memo[n] = climbStairs(n-1) + climbStairs(n-2)
        return memo[n]!
    }
}
