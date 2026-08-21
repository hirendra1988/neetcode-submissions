class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var sortedStr = strs.sorted()
        var first = Array(sortedStr.first!)
        var last = Array(sortedStr.last!)
        var result = ""

        for i in 0..<min(first.count, last.count) {
            if first[i] == last[i] {
                result.append(first[i])
            } else {
                break
            }
        }
        return result
    }
}
