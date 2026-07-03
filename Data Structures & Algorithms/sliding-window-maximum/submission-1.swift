class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = [Int]()
        for i in 0..<k {
            while !deque.isEmpty, nums[deque.last!] <= nums[i] {
                deque.removeLast()
            }
            deque.append(i)
        }
        var result = [Int]()
        for i in k..<nums.count {
            result.append(nums[deque.first!])

            while !deque.isEmpty, deque.first! <= i - k {
                deque.removeFirst()
            }

            while !deque.isEmpty, nums[deque.last!] <= nums[i] {
                deque.removeLast()
            }
            deque.append(i)
        }
        result.append(nums[deque.first!])
        return result
    }
}
