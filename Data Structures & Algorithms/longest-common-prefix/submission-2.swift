class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var sortedStrs = strs.sorted()
        var result = ""
        var minLength = Int.max
        for str in sortedStrs {
            minLength = min(minLength, str.count)
        }

        var index = 0
        let arrayStr1 = Array(sortedStrs[0])
        let arrayStr2 = Array(sortedStrs[sortedStrs.count-1])
        while index < minLength{
            if arrayStr1[index] == arrayStr2[index] {
                result.append(arrayStr1[index])
            } else {
                break
            }
            index += 1
        }
        return result
    }
}
