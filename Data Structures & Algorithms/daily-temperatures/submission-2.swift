class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var stack = [Int]()
        stack.append(n-1)
        var result = [Int](repeating: 0, count: n)
        
        for i in stride(from: n - 2, through: 0, by: -1) {
            while !stack.isEmpty, temperatures[stack.last!] <= temperatures[i] {
                stack.popLast()
            }
            if let last = stack.last {
                result[i] = last - i
            } else {
                result[i] = 0
            }
            stack.append(i)
        }
        return result
    }
}
