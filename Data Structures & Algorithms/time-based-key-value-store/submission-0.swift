class TimeMap {

    var hashMap = [String: [(value: String, timestamp: Int)]]()

    init() {
        
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        hashMap[key, default: []] += [(value: value, timestamp: timestamp)]
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        let array = hashMap[key, default: []]
        var left = 0
        var right = array.count - 1
        var result = ""
        while left <= right {
            let mid = (left + right)/2
            if array[mid].timestamp <= timestamp {
                result = array[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}
