class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 {
            return false
        }
        var hashMap = [Int: Int]()
        for val in hand {
            hashMap[val, default: 0] += 1
        }
        var sorted = hand.sorted()
        for key in sorted {
            if let count = hashMap[key], count <= 0 {
                continue
            }
            for i in 0..<groupSize {
                let newKey = key + i
                guard let count = hashMap[newKey], count > 0 else {
                    return false
                }
                hashMap[newKey]! -= 1
            }
        }
        return true
    }
}
