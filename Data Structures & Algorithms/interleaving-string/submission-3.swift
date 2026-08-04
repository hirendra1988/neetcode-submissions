class Solution {
   func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if (s1.count + s2.count) != s3.count {
            return false
        }
        return helper(Array(s1), Array(s2), Array(s3), 0, 0, 0)
    }

    func helper(_ s1: [Character],
                _ s2: [Character],
                _ s3: [Character],
                _ i: Int,
                _ j: Int,
                _ k: Int) -> Bool {
        if i == s1.count && j == s2.count && k == s3.count {
            return true
        }
        var ans = false
        if i < s1.count, k < s3.count, s1[i] == s3[k] {
            ans = helper(s1, s2, s3, i+1, j, k+1)
        }
        if j < s2.count, k < s3.count, s2[j] == s3[k] {
            ans = ans || helper(s1, s2, s3, i, j+1, k+1)
        }
        return ans
    }
}
