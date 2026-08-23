class MyHashSet {
    var hashSet: [Bool] = [Bool](repeating: false, count: 1000001)

    init() {

    }

    func add(_ key: Int) {
        hashSet[key] = true
    }
    
    func remove(_ key: Int) {
        hashSet[key] = false
    }
    
    func contains(_ key: Int) -> Bool {
        return hashSet[key]
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
