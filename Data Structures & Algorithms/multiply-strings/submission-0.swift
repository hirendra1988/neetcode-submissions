class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        let num1Array = num1.map { Int(String($0))! }
        let num2Array = num2.map { Int(String($0))! }
        var result = [Int](repeating: 0, count: num1.count + num2.count)
        for i in stride(from: num1.count-1, through: 0, by: -1) {
            for j in stride(from: num2.count-1, through: 0, by: -1) {
                let digit = num1Array[i] * num2Array[j] + result[i+j+1]
                result[i+j+1] = digit % 10
                result[i+j] += digit / 10
            }
        }
        while result.first == 0 {
            result.removeFirst()
        }
        return result.map { String(Int($0)) }.joined()
    }
}
