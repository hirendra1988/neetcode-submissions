/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    var minHeap = MinHeap()
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        let sorted = intervals.sorted { $0.start < $1.start }
        
        for interval in sorted {
            if !minHeap.isEmpty, minHeap.peek()! <= interval.start {
                minHeap.pop()
            }
            minHeap.push(interval.end)
        }
        return minHeap.count
    }
}

class MinHeap {
    private var nums = [Int]()
    init() {}

    var count: Int {
        return nums.count
    }

    func peek() -> Int? {
        return nums.first
    }

    var isEmpty: Bool {
        nums.isEmpty
    }

    func push(_ num: Int) {
        nums.append(num)
        shiftUp(count-1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            let parentIdx = (childIdx - 1)/2
            if nums[childIdx] < nums[parentIdx] {
                let temp = nums[childIdx]
                nums[childIdx] = nums[parentIdx]
                nums[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> Int? {
        if nums.isEmpty {
            return nil
        }
        if count == 1 {
            return nums.removeFirst()
        }
        let last = nums[count-1]
        nums[count-1] = nums[0]
        nums[0] = last
        let top = nums.removeLast()
        shiftDown(0)
        return top
    }

    func shiftDown(_ index: Int) {
        var smallest = index
        var left = 2*index + 1
        var right = 2*index + 2
        if left < count, nums[left] < nums[smallest] {
            smallest = left
        }
        if right < count, nums[right] < nums[smallest] {
            smallest = right
        }
        if smallest != index {
            let temp = nums[index]
            nums[index] = nums[smallest]
            nums[smallest] = temp
            shiftDown(smallest)
        }
    }
}