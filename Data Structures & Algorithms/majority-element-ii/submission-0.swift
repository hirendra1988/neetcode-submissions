class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var candidate1 = 0
        var candidate2 = 0
        var vote1 = 0
        var vote2 = 0
        for num in nums {
            if candidate1 == num {
                vote1 += 1
            } else if candidate2 == num {
                vote2 += 1
            } else if vote1 == 0 {
                candidate1 = num
                vote1 += 1
            } else if vote2 == 0 {
                candidate2 = num
                vote2 += 1
            } else {
                vote1 -= 1
                vote2 -= 1
            }
        }
        vote1 = 0
        vote2 = 0

        for num in nums {
            if candidate1 == num {
                vote1 += 1
            } else if candidate2 == num {
                vote2 += 1
            }
        }

        let thresold = nums.count/3
        var result = [Int]()
        if vote1 > thresold {
            result.append(candidate1)
        }
        if vote2 > thresold {
            result.append(candidate2)
        }
        return result
    }
}
