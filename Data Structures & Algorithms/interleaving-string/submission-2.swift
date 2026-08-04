class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let row = s1.count
        let col = s2.count
        if (row + col) != s3.count {
            return false
        }
        var memo: [[Bool?]] = [[Bool?]](repeating: [Bool?](repeating: nil, count: col+1), count: row+1)
        return helper(Array(s1), Array(s2), Array(s3), 0, 0, 0, &memo)
    }

    func helper(_ s1: [Character],
                _ s2: [Character],
                _ s3: [Character],
                _ i: Int,
                _ j: Int,
                _ k: Int,
                _ memo: inout [[Bool?]]) -> Bool {
        if i == s1.count && j == s2.count && k == s3.count {
            return true
        }
        if let res = memo[i][j] {
            return res
        }
        var ans = false
        if i < s1.count, k < s3.count, s1[i] == s3[k] {
            ans = helper(s1, s2, s3, i+1, j, k+1, &memo)
        }
        if j < s2.count, k < s3.count, s2[j] == s3[k] {
            ans = ans || helper(s1, s2, s3, i, j+1, k+1, &memo)
        }
        memo[i][j] = ans
        return memo[i][j]!
    }
}
