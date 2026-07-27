class Solution {
     func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var current = ""
        generateParenthesis(n, &result, 0, 0, &current)
        return result
    }

    func generateParenthesis(_ n: Int,
                            _ result: inout [String],
                            _ open: Int,
                            _ close: Int,
                            _ currentStr: inout String) {
        if currentStr.count == 2*n {
            result.append(currentStr)
            return
        }
        if open < n {
            currentStr += "("
            generateParenthesis(n, &result, open+1, close, &currentStr)
            currentStr.removeLast()
        }
        if close < open {
            currentStr += ")"
            generateParenthesis(n, &result, open, close+1, &currentStr)
            currentStr.removeLast()
        }
    }
}
