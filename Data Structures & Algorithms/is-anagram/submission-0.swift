class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var hashMap = [Character: Int]()
        for char in s {
            hashMap[char, default: 0] += 1
        }

        for char in t {
            hashMap[char, default: 0] -= 1
            if hashMap[char, default: 0] <= 0 {
                hashMap[char] = nil
            }
        }

        return hashMap.isEmpty
    }
}
