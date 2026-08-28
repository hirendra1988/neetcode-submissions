class Solution {
    func validPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        let sChars = Array(s)
        var left = 0
        var right = sChars.count - 1
        while left <= right {
            if sChars[left] != sChars[right] {
                return valid(sChars, left + 1, right) || valid(sChars, left, right-1)
            }
            left += 1
            right -= 1
        }
        
        return true
    }

    func valid(_ sChars: [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left
        var right = right
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
