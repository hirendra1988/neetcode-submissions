class Solution {
    var maxHeap = MaxHeap()
    func lastStoneWeight(_ stones: [Int]) -> Int {
        for stone in stones {
            maxHeap.push(stone)
        }
        while maxHeap.count > 1 {
            let firstLargest = maxHeap.pop() ?? 0
            let secondLargest = maxHeap.pop() ?? 0
            if firstLargest != secondLargest {
                maxHeap.push(firstLargest - secondLargest)
            }
        }
        return maxHeap.peek() ?? 0
    }
}

class MaxHeap {
    private var stones = [Int]()
    init() {}

    var count: Int {
        return stones.count
    }

    func peek() -> Int? {
        return stones.first
    }

    func push(_ val: Int) {
        stones.append(val)
        shiftUp(count - 1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            var parentIdx = (childIdx - 1)/2
            if stones[childIdx] > stones[parentIdx] {
                let temp = stones[childIdx]
                stones[childIdx] = stones[parentIdx]
                stones[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> Int? {
        if stones.isEmpty {
            return nil
        }
        let last = stones[count-1]
        stones[count-1] = stones[0]
        stones[0] = last
        let top = stones.removeLast()
        shiftDown(0)
        return top
    }

    func shiftDown(_ index: Int) {
        var largest = index
        var left = 2*index + 1
        var right = 2*index + 2
        if left < count, stones[left] > stones[largest] {
            largest = left
        }
        if right < count, stones[right] > stones[largest] {
            largest = right
        }
        if largest != index {
            let temp = stones[largest]
            stones[largest] = stones[index]
            stones[index] = temp
            shiftDown(largest)
        }
    }
 }