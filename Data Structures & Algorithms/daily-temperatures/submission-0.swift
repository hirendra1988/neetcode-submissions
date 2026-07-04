class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result = [Int](repeating: 0, count: n)
        for i in stride(from: n - 2, through: 0, by: -1) {
            var temp = 0
            for j in i..<n {
                if temperatures[j] > temperatures[i] {
                    result[i] = temp
                    break
                }
                temp += 1
            }
        }
        return result
    }
}
