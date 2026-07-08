class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = prices[0]
        for i in 0..<prices.count {
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, prices[i]-minPrice)
        }
        return maxProfit
    }
}
