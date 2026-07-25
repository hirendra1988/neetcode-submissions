class KthLargest {
    var size = 0
    var minHeap = MinHeap()
    init(_ k: Int, _ nums: [Int]) {
        self.size = k
        for num in nums {
            add(num)
        }
    }

    func add(_ val: Int) -> Int {
        if minHeap.count < size {
            minHeap.push(val)
        } else if minHeap.peek() ?? 0 < val {
            minHeap.pop()
            minHeap.push(val)
        }
        return minHeap.peek() ?? 0
    }
}

class MinHeap {
    private var nums = [Int]()
    init() {

    }

    var count: Int {
        return nums.count
    }

    func peek() -> Int? {
        return nums.first
    }

    func push(_ val: Int) {
        nums.append(val)
        shiftUp(count - 1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            var parentIdx = (childIdx - 1)/2
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
        let left = 2*index + 1
        let right = 2*index + 2
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