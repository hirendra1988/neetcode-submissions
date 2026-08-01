class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalGas = 0
        var totalCost = 0
        for i in 0..<gas.count {
            totalGas += gas[i]
            totalCost += cost[i]
        }

        if totalCost > totalGas {
            return -1
        }
        var currentGas = 0
        var startIndex = 0
        for i in 0..<cost.count {
            currentGas += gas[i] - cost[i]
            if currentGas < 0 {
                currentGas = 0
                startIndex = i+1
            }
        }
        return startIndex
    }
}
