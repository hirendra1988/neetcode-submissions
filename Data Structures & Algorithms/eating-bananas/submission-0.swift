class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var maxPile = 0
        for pile in piles {
            maxPile = max(pile, maxPile)
        }
        var left = 1
        var right = maxPile

        while left <= right {
            let mid = (left + right)/2
            if canEatAllBnanas(piles, h, mid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func canEatAllBnanas(_ piles: [Int], _ h: Int, _ speed: Int) -> Bool {
        var hours = 0
        for pile in piles {
            hours += (pile + speed - 1)/speed
        }
        return hours <= h
    }
}
