class LRUCache {

    var cache = [Int: Node]()
    var size: Int = 0

    var head: Node?
    var tail: Node?

    init(_ capacity: Int) {
        self.size = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            setHead(node)
            return node.data!
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.data = value
            setHead(node)
            return
        }
        if cache.count == size {
            if let key = tail?.key {
                removeTail()
                cache[key] = nil
            }
        }
        let newNode = Node(key, value)
        setHead(newNode)
        cache[key] = newNode
    }

    func unlinkNode(_ node: Node?) {
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        node?.next = nil
        node?.prev = nil
    }

    func setHead(_ node: Node?) {
        if head == nil {
            head = node
            tail = node
            return
        }
        if head === node {
            return
        }
        if node === tail {
            removeTail()
        }
        unlinkNode(node)

        node?.next = head
        head?.prev = node
        head = node
    }

    func removeTail() {
        if head === tail || head == nil {
            head = nil
            tail = nil
            return
        }
        tail = tail?.prev
        tail?.next = nil
    }
}

class Node {
    var next: Node?
    var prev: Node?
    var key: Int?
    var data: Int?

    init(_ key: Int, _ data: Int) {
        self.key = key
        self.data = data
    }
}