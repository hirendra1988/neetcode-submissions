class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        for i in 1...32 {
            let lsb = n & 1
            let reverseLSB = lsb << (32-i)
            result = result | reverseLSB
            n = n >> 1
        }
        return result
    }
}
