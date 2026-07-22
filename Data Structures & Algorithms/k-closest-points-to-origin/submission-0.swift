class Solution {
    var maxHeap = MaxHeap()
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        for point in points {
            let x1 = point[0]
            let y1 = point[1]
            let dist = x1*x1 + y1*y1
            maxHeap.push((dist, point))
            if maxHeap.count > k {
                maxHeap.pop()
            }
        }

        while let curPoint = maxHeap.pop() {
            result.append(curPoint.1)
        }
        return result
    }
}

class MaxHeap {
    private var points = [(Int, [Int])]()
    init() {}

    var count: Int {
        return points.count
    }

    func push(_ element: (Int, [Int])) {
        points.append(element)
        shiftUp(count - 1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            let parentIdx = (childIdx - 1)/2
            if points[childIdx].0 > points[parentIdx].0 {
                let temp = points[childIdx]
                points[childIdx] = points[parentIdx]
                points[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> (Int, [Int])? {
        if points.isEmpty {
            return nil
        }
        if points.count == 1 {
            return points.removeLast()
        }
        let last = points[count - 1]
        points[count - 1] = points[0]
        points[0] = last
        let top = points.removeLast()
        shiftDown(0)
        return top
    }

    func shiftDown(_ index: Int) {
        var largest = index
        var left = 2*index + 1
        var right = 2*index + 2

        if left < count, points[left].0 > points[largest].0 {
            largest = left
        }

        if right < count, points[right].0 > points[largest].0 {
            largest = right
        }

        if largest != index {
            let temp = points[index]
            points[index] = points[largest]
            points[largest] = temp
            shiftDown(largest)
        }
    }
}