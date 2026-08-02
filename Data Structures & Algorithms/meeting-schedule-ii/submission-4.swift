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
            if  minHeap.peek() ?? 0 <= interval.start {
                minHeap.pop()
            }
            minHeap.push(interval.end)
        }
        return minHeap.count
    }
}

class MinHeap {
    private var heap = [Int]()
    init() {}

    var count: Int {
        return heap.count
    }

    func peek() -> Int? {
        return heap.first
    }

    var isEmpty: Bool {
        heap.isEmpty
    }

    func push(_ val: Int) {
        heap.append(val)
        shiftUp(count-1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            let parentIdx = (childIdx - 1)/2
            if heap[childIdx] < heap[parentIdx] {
                let temp = heap[childIdx]
                heap[childIdx] = heap[parentIdx]
                heap[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> Int? {
        if heap.isEmpty {
            return nil
        }
        if count == 1 {
            return heap.removeFirst()
        }
        let last = heap[count-1]
        heap[count-1] = heap[0]
        heap[0] = last
        let top = heap.removeLast()
        shiftDown(0)
        return top
    }

    func shiftDown(_ index: Int) {
        var smallest = index
        var left = 2*index + 1
        var right = 2*index + 2
        if left < count, heap[left] < heap[smallest] {
            smallest = left
        }
        if right < count, heap[right] < heap[smallest] {
            smallest = right
        }
        if smallest != index {
            let temp = heap[index]
            heap[index] = heap[smallest]
            heap[smallest] = temp
            shiftDown(smallest)
        }
    }
}