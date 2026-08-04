class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty { return word2.count }
        if word2.isEmpty { return word1.count }

        let word1Array = Array(word1)
        let word2Array = Array(word2)
        let rows = word1.count
        let cols = word2.count
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: cols+1), count: rows+1)
        for i in 0...rows {
            dp[i][0] = i
        }
        for j in 0...cols {
            dp[0][j] = j
        }

        for i in 1...rows {
            for j in 1...cols {
                if word1Array[i-1] == word2Array[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    let topLeft = dp[i-1][j-1]
                    let left = dp[i][j-1]
                    let top = dp[i-1][j]
                    let minVal = min(topLeft, left)
                    let finalMinVal = min(minVal, top) + 1
                    dp[i][j] = finalMinVal
                }
            }
        }
        return dp[rows][cols]
    }
}
