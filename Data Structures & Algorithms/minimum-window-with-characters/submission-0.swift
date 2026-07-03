class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var hashMap = [Character: Int]()
        for char in t {
            hashMap[char, default: 0] += 1
        }
        var minLength = Int.max
        var left = 0
        let sChars = Array(s)
        var matched = 0
        var start = 0
        for right in 0..<sChars.count {

            // Expand
            if let _ = hashMap[sChars[right]] {
                hashMap[sChars[right], default: 0] -= 1
                if hashMap[sChars[right], default: 0] >= 0 {
                    matched += 1
                }
            }

            // Shrink
            while matched == t.count {
                let window = right - left + 1
                if minLength > window {
                    minLength = window
                    start = left
                }
                if let leftChar = hashMap[sChars[left]] {
                    if leftChar == 0 {
                        matched -= 1
                    }
                    hashMap[sChars[left], default: 0] += 1
                }
                left += 1
            }
        }
        return minLength == Int.max ? "" : String(sChars[start..<start+minLength])
    }
}
