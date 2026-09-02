class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for asteroid in asteroids {
            if stack.isEmpty || asteroid > 0 {
                stack.append(asteroid)
                continue
            }
            while let last = stack.last, last > 0, last < abs(asteroid) {
                stack.popLast()
            }
            if let last = stack.last {
                if last == abs(asteroid) {
                    stack.popLast()
                } else if last < 0 {
                    stack.append(asteroid)
                }
            } else {
                stack.append(asteroid)
            }
        }
        return stack
    }
}
