class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 < $1.0 }
        var stack = [Double]()
        for (p, s) in cars {
            let time = Double(target - p)/Double(s)
            while !stack.isEmpty, stack.last! <= time {
                stack.popLast()
            }
            stack.append(time)
        }
        return stack.count
    }
}
