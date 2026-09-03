class Solution {
    
    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        let n = nums.count
        
        if n == 1 {
            return true
        }
        
        // 1 cannot have GCD > 1 with anything
        if nums.contains(1) {
            return false
        }
        
        let maxValue = nums.max()!
        
        // Smallest Prime Factor
        var spf = Array(0...maxValue)
        
        if maxValue >= 1 {
            for i in 2...maxValue {
                if spf[i] == i {
                    if i <= maxValue / i {
                        var j = i * i
                        
                        while j <= maxValue {
                            if spf[j] == j {
                                spf[j] = i
                            }
                            j += i
                        }
                    }
                }
            }
        }
        
        let dsu = DSU(maxValue)
        
        // 2. Connect every number to its prime factors
        for num in nums {
            var x = num
            
            while x > 1 {
                let prime = spf[x]
                
                dsu.union(num, prime)
                
                while x % prime == 0 {
                    x /= prime
                }
            }
        }
        
        // 3. Check whether all numbers belong
        //    to the same connected component
        let root = dsu.find(nums[0])
        
        for num in nums {
            if dsu.find(num) != root {
                return false
            }
        }
        
        return true
    }

    // MARK: - Union Find
    class DSU {
        var parent: [Int]
        var rank: [Int]
        
        init(_ n: Int) {
            parent = Array(0...n)
            rank = Array(repeating: 0, count: n + 1)
        }
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ a: Int, _ b: Int) {
            let rootA = find(a)
            let rootB = find(b)
            
            if rootA == rootB {
                return
            }
            
            if rank[rootA] < rank[rootB] {
                parent[rootA] = rootB
            } else if rank[rootA] > rank[rootB] {
                parent[rootB] = rootA
            } else {
                parent[rootB] = rootA
                rank[rootA] += 1
            }
        }
    }
    
}