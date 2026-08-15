class Solution {
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        let sortedQuery = queries.enumerated().sorted { $0.element < $1.element }
        var result = [Int](repeating: -1, count: sortedQuery.count)
        var minHeap = MinHeap()
        var sortedIndex = 0

        for (queryIndex, query) in sortedQuery {
            while sortedIndex < sortedIntervals.count, sortedIntervals[sortedIndex][0] <= query {
                let start = sortedIntervals[sortedIndex][0]
                let end = sortedIntervals[sortedIndex][1]
                let size = end - start + 1
                let node = Node(size: size, end: end)
                minHeap.push(node)
                sortedIndex += 1
            }

            while let top = minHeap.peek(), top.end < query {
                minHeap.pop()
            }
            if let top = minHeap.peek() {
                result[queryIndex] = top.size
            }
        }
        return result
    }
}

struct Node {
    var size: Int
    var end: Int
}

class MinHeap {
    var nodes = [Node]()
    init() { }

    var count: Int {
        return nodes.count
    }

    func peek() -> Node? {
        return nodes.first
    }

    func push(_ node: Node) {
        nodes.append(node)
        shiftUp(nodes.count - 1)
    }

    func shiftUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            var parentIdx = (childIdx - 1)/2
            if nodes[childIdx].size < nodes[parentIdx].size {
                let temp = nodes[childIdx]
                nodes[childIdx] = nodes[parentIdx]
                nodes[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func pop() -> Node? {
        if nodes.count <= 1 {
            return nodes.removeFirst()
        }
        let last = nodes[nodes.count-1]
        nodes[nodes.count-1] = nodes[0]
        nodes[0] = last
        let top = nodes.removeLast()
        shiftDown(0)
        return top
    }

    func shiftDown(_ index: Int) {
        var smallest = index
        var left = index * 2 + 1
        var right = index * 2 + 2
        if left < nodes.count, nodes[left].size < nodes[smallest].size {
            smallest = left
        }
        if right < nodes.count, nodes[right].size < nodes[smallest].size {
            smallest = right
        }
        if smallest != index {
            let temp = nodes[smallest]
            nodes[smallest] = nodes[index]
            nodes[index] = temp
            shiftDown(smallest)
        }
    }
}