class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count {
            return false
        }
        var hashMap = [Character: Int]()
        for char in s1 {
            hashMap[char, default: 0] += 1
        }
        var left = 0
        var right = 0
        let s2Chars = Array(s2)
        while left < s2.count, right < s2.count {
            if let _ = hashMap[s2Chars[right]] {
                hashMap[s2Chars[right], default: 0] -= 1
                if hashMap[s2Chars[right], default: 0] <= 0 {
                    hashMap[s2Chars[right]] = nil
                }
                if hashMap.isEmpty {
                    return true
                }
                right += 1
            } else if left < right {
                hashMap[s2Chars[left], default: 0] += 1
                left += 1
            } else {
                left += 1
                right += 1
            }
        }
        return hashMap.isEmpty
    }
}
