class Solution {
   var hashMap = ["1": [],
                  "2": ["a", "b", "c"],
                  "3": ["d", "e", "f"],
                  "4": ["g", "h", "i"],
                  "5": ["j", "k", "l"],
                  "6": ["m", "n", "o"],
                  "7": ["p", "q", "r", "s"],
                  "8": ["t", "u", "v"],
                  "9": ["w", "x", "y", "z"]
    ]
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        var result = [String]()
        var currentStr = ""
        helper(Array(digits), &result, &currentStr, 0)
        return result
    }

    func helper(_ digits: [Character],
               _ result: inout [String],
               _ currentStr: inout String,
               _ index: Int) {
        if index == digits.count {
            result.append(currentStr)
            return
        }

        if let words = hashMap[String(digits[index])] {
            for word in words {
                currentStr += word
                helper(digits, &result, &currentStr, index+1)
                currentStr.removeLast()
            }
        }
    }
}
