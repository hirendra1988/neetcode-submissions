class Solution {
    func foreignDictionary(_ words: [String]) -> String {
        var graph = [Character: Set<Character>]()
        var inDegree = [Character: Int]()

        // Add every character
        for word in words {
            for ch in word {
                graph[ch] = []
                inDegree[ch] = 0
            }
        }

        // Build graph
        for i in 0..<words.count-1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i+1])

            var minLength = min(word1.count, word2.count)
            var foundDiff = false
            for j in 0..<minLength {
                let from = word1[j]
                let to = word2[j]
                if word1[j] != word2[j] {
                    if !graph[from]!.contains(to) {
                        graph[from]!.insert(to)
                        inDegree[to]! += 1
                    }
                    foundDiff = true
                    break
                }
            }

            // Invalid case:
            // ["abc", "ab"]
            if !foundDiff && word1.count > word2.count {
                return ""
            }
        }

        // Topological sort
        var queue = [Character]()
        for (ch, degree) in inDegree {
            if inDegree[ch] == 0 {
                queue.append(ch)
            }
        }

        var result = ""

        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current)

            for neighbour in graph[current]! {
                inDegree[neighbour]! -= 1
                if inDegree[neighbour] == 0 {
                    queue.append(neighbour)
                }
            }
        }

        // Cycle exists
        if result.count != inDegree.count {
            return ""
        }

        return result
    }
}
