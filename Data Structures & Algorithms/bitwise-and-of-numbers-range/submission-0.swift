class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var res = left
        if left < right {
            for i in (left+1)...right {
                res = res & i
            }
        }
        return res
    }
}
