class Solution {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var tempSet = [String]()
        partition(Array(s), &result, &tempSet, 0)
        return result
    }

    func partition(_ sChars: [Character],
                   _ result: inout [[String]],
                   _ tempSet: inout [String], 
                   _ index: Int) {
        if index == sChars.count {
            result.append(tempSet)
            return
        }
        for i in index..<sChars.count {
            let word = Array(sChars[index...i])
            if checkPallingdrome(word) {
                tempSet.append(String(word))
                partition(sChars, &result, &tempSet, i+1)
                tempSet.removeLast()
            }
        }
    }

    func checkPallingdrome(_ words: [Character]) -> Bool {
        var left = 0
        var right = words.count - 1
        while left <= right {
            if words[left] != words[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
