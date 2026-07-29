class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var prices = [Int](repeating: amount + 1, count: amount + 1)
        prices[0] = 0

        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    let res = prices[i-coin]
                    prices[i] = min(res + 1, prices[i])
                }
            }
        }
        return prices[amount] > amount ? -1 : prices[amount]
    }
}
