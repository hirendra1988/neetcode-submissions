class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var sortedArray = [Int]()
        var left = 0
        var right = 0
        let n1 = nums1.count
        let n2 = nums2.count

        while left < n1, right < n2 {
            if nums1[left] < nums2[right] {
                sortedArray.append(nums1[left])
                left += 1
            } else {
                sortedArray.append(nums2[right])
                right += 1
            }
        }

        while left < n1 {
            sortedArray.append(nums1[left])
            left += 1
        }

        while right < n2 {
            sortedArray.append(nums2[right])
            right += 1
        }

        let midIndex = (sortedArray.count / 2)
        if sortedArray.count % 2 == 0 {
            let value = Double(sortedArray[midIndex] + sortedArray[midIndex-1])
            return value / 2.0
        }
        return Double(sortedArray[midIndex])
    }
}
