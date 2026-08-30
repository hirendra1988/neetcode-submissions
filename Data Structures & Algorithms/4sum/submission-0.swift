class Solution {
    //https://www.youtube.com/watch?v=X6sL8JTROLY&t=36s
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count <= 3 {
            return []
        }
        var left = 0
        var right = 0
        var result = Set<[Int]>()
        var nums = nums.sorted()
        for i in 0..<nums.count {
            if i > 0, nums[i] == nums[i-1] {
                continue
            }
            for j in i+1..<nums.count {
                if j > i+1, nums[j] == nums[j-1] {
                    continue
                }
                left = j + 1
                right = nums.count - 1

                while left < right {
                    let currentSum = nums[i] + nums[j] + nums[left] + nums[right]
                    if currentSum == target {
                        result.insert([nums[i], nums[j], nums[left], nums[right]])
                        left += 1
                        right -= 1
                        while left < right, nums[left] == nums[left-1] {
                            left += 1
                        }
                        while left < right, nums[right] == nums[right+1] {
                            right -= 1
                        }
                        continue
                    }
                    if currentSum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return Array(result)
    }
}