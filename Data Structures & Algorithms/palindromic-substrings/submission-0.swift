class Solution {
    func countSubstrings(_ s: String) -> Int {
        var sChars = Array(s)
        var left = 0
        var right = 0
        var maxSize = Int.min
        var result = 0

        for i in 0..<sChars.count {
            // Odd length
            left = i
            right = i

            while left >= 0, right < sChars.count {
                if sChars[left] != sChars[right] {
                    break
                }
                let windowSize = right - left + 1
                if windowSize > maxSize {
                    maxSize = windowSize
                }
                left -= 1
                right += 1
                result += 1
            }

            // Even length
            left = i
            right = i + 1

            while left >= 0, right < sChars.count {
                if sChars[left] != sChars[right] {
                    break
                }
                let windowSize = right - left + 1
                if windowSize > maxSize {
                    maxSize = windowSize
                }
                left -= 1
                right += 1
                result += 1
            }
        }
        return result
    }
}
