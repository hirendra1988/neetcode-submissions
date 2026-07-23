class MedianFinder {

    var nums = [Int]()
    
    func addNum(_ num: Int) {
        if nums.count == 0 {
            nums.append(num)
            return
        }
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right)/2
            if nums[mid] < num {
                left = mid + 1
            } else if nums[mid] > num {
                right = mid - 1
            } else {
                left = mid + 1
                break
            }
        }
        nums.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        let median = nums.count/2
        if nums.count % 2 == 0 {
            return Double(nums[median - 1] + nums[median])/2.0
        }
        return Double(nums[median])
    }
}
