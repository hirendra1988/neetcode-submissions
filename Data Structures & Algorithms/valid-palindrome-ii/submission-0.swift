class Solution {
   func validPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        let sChars = Array(s)
        if valid(sChars) {
            return true
        }
        for i in 0..<sChars.count {
            let leftHalf = (i <= 0) ? "" : String(sChars[0...i-1])
            let rightHalf = i >= sChars.count ? "" : String(sChars[i+1..<sChars.count])
            let finalWord = String(leftHalf + rightHalf)
            if valid(Array(finalWord)) {
                return true
            }
        }
        return false
    }

    func valid(_ sChars: [Character]) -> Bool {
        var left = 0
        var right = sChars.count - 1
        while left <= right {
            if sChars[left] != sChars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
