class MinStack {

    var minStack = [(minVal: Int, val: Int)]()

    init() {

    }

    func push(_ val: Int) {
        if let lastVal = minStack.last {
            let minVal = min(lastVal.minVal, val)
            minStack.append((minVal: minVal, val: val))
        } else {
            minStack.append((minVal: val, val: val))
        }
    }

    func pop() {
        minStack.popLast()
    }

    func top() -> Int {
        if let tuple = minStack.last {
            return tuple.val
        }
        return 0
    }

    func getMin() -> Int {
        if let tuple = minStack.last {
            return tuple.minVal
        }
        return 0
    }
}
