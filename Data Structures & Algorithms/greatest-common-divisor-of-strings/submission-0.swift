class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if (str1 + str2) != (str2 + str1) {
            return ""
        }
        let length = gcdLength(str1.count, str2.count)
        return String(str1.prefix(length))
    }

    func gcdLength(_ value1: Int, _ value2: Int) -> Int {
        var a = value1
        var b = value2

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}
