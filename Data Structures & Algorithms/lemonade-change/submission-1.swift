class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        if bills.isEmpty || bills[0] > 5 {
            return false
        }
        
        var fiveDollerCount = 0
        var tenDollerCount = 0
        for i in 0..<bills.count {
            if bills[i] == 5 {
                fiveDollerCount += 1
            } else if bills[i] == 10 {
                fiveDollerCount -= 1
                tenDollerCount += 1
            } else {
                if tenDollerCount > 0 {
                    tenDollerCount -= 1
                    fiveDollerCount -= 1
                } else {
                    fiveDollerCount -= 3
                }
            }
            if fiveDollerCount < 0 || tenDollerCount < 0 {
                return false
            }
        }
        return true
    }
}