class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var left = 0
        var right = people.count - 1
        var sortedPeople = people.sorted()
        var count = 0
        while left <= right {
            if (sortedPeople[left] + sortedPeople[right]) <= limit {
                left += 1
            }
            right -= 1
            count += 1
        }
        return count
    }
}
