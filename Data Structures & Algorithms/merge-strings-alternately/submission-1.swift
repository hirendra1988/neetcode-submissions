class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let word1Chars = Array(word1)
        let word2Chars = Array(word2)
        var i = 0
        var j = 0
        var result = ""

        while i < word1Chars.count || j < word2Chars.count {
            if i < word1Chars.count {
                result.append(word1Chars[i])
                i += 1
            }
            
            if j < word2Chars.count {
                result.append(word2Chars[j])
                j += 1
            }
        }

        return result
    }
}
