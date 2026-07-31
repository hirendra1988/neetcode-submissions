class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [String: Int]()
        return changeHelper(amount, coins, 0, &dp)
    }

    func changeHelper(_ amount: Int,
                      _ coins: [Int],
                      _ index: Int,
                      _ dp: inout [String: Int]) -> Int {
        if amount == 0 {
            return 1
        }
        if amount < 0 || index >= coins.count {
            return 0
        }

        if let cache = dp["\(amount)\(index)"] {
            return cache
        }

        var result = 0
        for i in index..<coins.count {
            if amount >= coins[i] {
                result += changeHelper(amount - coins[i], coins, i, &dp)
            }
        }
        dp["\(amount)\(index)"] = result
        return result
    }
}
