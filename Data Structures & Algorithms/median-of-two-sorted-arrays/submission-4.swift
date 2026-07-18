class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let smaller = nums1.count > nums2.count ? nums2 : nums1
        let larger = nums1.count > nums2.count ? nums1 : nums2

        let totalCount = smaller.count + larger.count
        var left = 0
        var right = smaller.count

        while left <= right {
            let partitionX = (left + right)/2
            let partitionY = (totalCount + 1)/2 - partitionX

            let l1 = partitionX == 0 ? Int.min : smaller[partitionX-1]
            let l2 = partitionY == 0 ? Int.min : larger[partitionY-1]

            let r1 = partitionX == smaller.count ? Int.max : smaller[partitionX]
            let r2 = partitionY == larger.count ? Int.max : larger[partitionY]

            if l1 <= r2 && l2 <= r1 {
                if totalCount % 2 == 0 {
                    let value = max(l1,l2) + min(r1,r2)
                    return Double(value) / 2.0
                } else {
                    return Double(max(l1,l2))
                }
            }
            if l1 > r2 {
                right = partitionX - 1
            } else {
                left = partitionX + 1
            }
        }
        return 0
    }
}
