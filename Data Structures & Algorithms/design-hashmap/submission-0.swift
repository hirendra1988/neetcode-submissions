class MyHashMap {

    var hashMap: [Int] = [Int](repeating: -1, count: 1000001)

    init() {
        
    }
    
    func put(_ key: Int, _ value: Int) {
        hashMap[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return hashMap[key] ?? -1
    }
    
    func remove(_ key: Int) {
        hashMap[key] = -1
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
