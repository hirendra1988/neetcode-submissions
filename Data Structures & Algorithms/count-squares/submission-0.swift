class CountSquares {
    var hashMap = [[Int]: Int]()

    func add(_ point: [Int]) {
        hashMap[point, default: 0] += 1
    }

    func count(_ point: [Int]) -> Int {
        var result = 0
        for (key, value) in hashMap {
            if key == point {
                continue
            }
            if abs(key[0]-point[0]) != abs(key[1]-point[1]) {
                continue
            }
            let point1 = [key[0], point[1]]
            let point2 = [point[0], key[1]]
            guard let point1Count = hashMap[point1] else { continue }
            guard let point2Count = hashMap[point2] else { continue }
            result += value * point1Count * point2Count
        }
        return result
    }
}
