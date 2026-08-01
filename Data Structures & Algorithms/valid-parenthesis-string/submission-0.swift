class Solution {
    func checkValidString(_ s: String) -> Bool {
        let sChars = Array(s)
        if !sChars.isEmpty && sChars[0] == ")" {
            return false
        }
        var s1 = [Int]()
        var s2 = [Int]()
       
        for i in 0..<sChars.count {
            if sChars[i] == "(" {
                s1.append(i)
            } else if sChars[i] == "*" {
                s2.append(i)
            } else {
                if !s1.isEmpty {
                    s1.popLast()
                } else if !s2.isEmpty {
                    s2.popLast()
                } else {
                    return false
                }
            }
        }

        while !s1.isEmpty, !s2.isEmpty {
            let openIndex = s1.popLast() ?? 0
            let closeIndex = s2.popLast() ?? 0
            if openIndex > closeIndex {
                return false
            }
        }

        return s1.isEmpty
    }
}
