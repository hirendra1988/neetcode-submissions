class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var result = [false, false, false]
        for t in triplets {
            if t[0] > target[0] || t[1] > target[1] || t[2] > target[2] {
                continue
            }
            if t[0] == target[0] {
                result[0] = true
            }
            if t[1] == target[1] {
                result[1] = true
            }
            if t[2] == target[2] {
                result[2] = true
            }
        }
        return result[0] && result[1] && result[2]
    }
}
