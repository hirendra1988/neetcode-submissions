class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = [String: Int]()
        return maxProfit(0, prices, true, &dp)
    }

    func maxProfit(_ i: Int, _ prices: [Int], _ buying: Bool, _ dp: inout [String: Int]) -> Int {
        if i >= prices.count {
            return 0
        }
        if let cache = dp["\(buying)\(i)"] {
            return cache
        }
        if buying {
            let buy = maxProfit(i+1, prices, false, &dp) - prices[i]
            let noBuy = maxProfit(i+1, prices, true, &dp)
            dp["\(buying)\(i)"] = max(buy, noBuy)
        } else {
            let sell = maxProfit(i+2, prices, true, &dp) + prices[i]
            let noSell = maxProfit(i+1, prices, false, &dp)
            dp["\(buying)\(i)"] = max(sell, noSell)
        }
        return dp["\(buying)\(i)"] ?? 0
    }
}
