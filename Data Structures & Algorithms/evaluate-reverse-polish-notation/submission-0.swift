class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()

        for token in tokens {
            if let tokenVal = Int(token) {
                stack.append(tokenVal)
                continue
            }
            let token1 = stack.popLast() ?? 0
            let token2 = stack.popLast() ?? 0
            switch token {
                case "+":
                    stack.append(token1 + token2)
                case "*":
                    stack.append(token1 * token2)
                case "/":
                    stack.append(token2 / token1)
                case "-":
                    stack.append(token2 - token1)
                default:
                    break
            }
        }
        return stack.last ?? 0
    }
}
