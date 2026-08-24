class Solution {
    var tempNums = [Int]()
    func sortArray(_ nums: [Int]) -> [Int] {
        tempNums = Array(repeating: 0, count: nums.count)
        var nums = nums
        mergeSort(&nums, 0, nums.count-1)
        return nums
    }

    func mergeSort(_ nums: inout [Int], _ start: Int, _ end: Int) {
        if start >= end {
            return
        }
        let mid = (start + end)/2
        mergeSort(&nums, start, mid)
        mergeSort(&nums, mid+1, end)
        merge(&nums, start, end, mid)
    }

    func merge(_ nums: inout [Int], _ start: Int, _ end: Int, _ mid: Int) {
        var i = start
        var j = mid+1
        var k = start
        while i <= mid, j <= end {
            if nums[i] > nums[j] {
                tempNums[k] = nums[j]
                j += 1
            } else {
                tempNums[k] = nums[i]
                i += 1
            }
            k += 1
        }

        while i <= mid {
            tempNums[k] = nums[i]
            i += 1
            k += 1
        }

        while j <= end {
            tempNums[k] = nums[j]
            j += 1
            k += 1
        }

        for i in start...end {
            nums[i] = tempNums[i]
        }
    }
}