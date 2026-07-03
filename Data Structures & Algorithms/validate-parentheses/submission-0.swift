class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }
                if stack.last! == "(" && char == ")" ||
                stack.last! == "{" && char == "}" ||
                stack.last! == "[" && char == "]" {
                    stack.popLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
