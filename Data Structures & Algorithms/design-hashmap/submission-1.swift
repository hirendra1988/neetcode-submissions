class MyHashMap {

    var buckets: [[(key: Int, value: Int)]]
    var size = 1000

    init() {
        buckets = Array(repeating: [], count: size)
    }

    func getIndex(_ key: Int) -> Int {
        return key % size
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = getIndex(key)
        for i in 0..<buckets[index].count {
            if buckets[index][i].key == key {
                buckets[index][i].value = value
                return
            }
        }
        buckets[index].append((key: key, value: value))
    }
    
    func get(_ key: Int) -> Int {
        let index = getIndex(key)
        for i in 0..<buckets[index].count {
            if buckets[index][i].key == key {
                return buckets[index][i].value
            }
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let index = getIndex(key)
        buckets[index].removeAll { $0.key == key } 
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
