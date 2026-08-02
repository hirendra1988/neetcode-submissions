class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var hashMap = [Character: Int]()
        for task in tasks {
            hashMap[task, default: 0] += 1
        }
        let maxHeap = MaxHeap()
        for (_, val) in hashMap {
            maxHeap.push(val)
        }
        var time = 0
        while !maxHeap.isEmpty {
            var cycle = 0
            var temp = [Int]()
            while cycle <= n {
                if let count = maxHeap.pop(), count > 1 {
                    temp.append(count-1)
                }
                time += 1
                cycle += 1
                if temp.isEmpty && maxHeap.isEmpty {
                    break
                }
            }
            for count in temp {
                maxHeap.push(count)
            }
        }
        return time
    }
}

class MaxHeap {
    private var tasks = [Int]()
    init() {}

    var count: Int {
        return tasks.count
    }

    var isEmpty: Bool {
        return tasks.isEmpty
    }

    func peek() -> Int? {
        return tasks.first
    }

    func push(_ val: Int) {
        tasks.append(val)
        shiftUp(count-1)
    }

    private func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            let parentIdx = (childIdx-1)/2
            if tasks[childIdx] > tasks[parentIdx] {
                let temp = tasks[childIdx]
                tasks[childIdx] = tasks[parentIdx]
                tasks[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> Int? {
        if tasks.isEmpty {
            return nil
        }
        if count == 1 {
            return tasks.removeLast()
        }
        let last = tasks[count-1]
        tasks[count-1] = tasks[0]
        tasks[0] = last
        let top = tasks.removeLast()
        shiftDown(0)
        return top
    }

    private func shiftDown(_ index: Int) {
        var largest = index
        let left = 2*index + 1
        let right = 2*index + 2

        if left < count, tasks[left] > tasks[largest] {
            largest = left
        }
        if right < count, tasks[right] > tasks[largest] {
            largest = right
        }
        if largest != index {
            let temp = tasks[index]
            tasks[index] = tasks[largest]
            tasks[largest] = temp
            shiftDown(largest)
        }
    }
}