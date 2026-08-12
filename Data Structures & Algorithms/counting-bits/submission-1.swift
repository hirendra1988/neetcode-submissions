class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int]()
        for i in 0...n {
            var i = i 
            var count = 0
            while i > 0 {
                i = i & (i-1)
                count += 1
            }
            result.append(count)
        }
        return result
    }
}
