class Solution {
    var minHeap = MinHeap()
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        for num in nums {
            minHeap.push(num)
            if minHeap.count > k {
                minHeap.pop()
            }
        }
        return minHeap.peek() ?? 0
    }
}

class MinHeap {
    var nums = [Int]()
    init() {}

    var count: Int {
        return nums.count
    }

    func peek() -> Int? {
        return nums.first
    }

    func push(_ val: Int) {
        nums.append(val)
        shiftUp(count-1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            var parentIdx = (childIdx-1)/2
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
            let temp = nums[smallest]
            nums[smallest] = nums[index]
            nums[index] = temp
            shiftDown(smallest)
        }
    }
}