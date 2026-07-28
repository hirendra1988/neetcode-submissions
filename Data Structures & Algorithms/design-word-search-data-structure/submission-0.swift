class WordDictionary {

    class Node {
        var children = [Character: Node]()
        var isEndOfWord = false
    }

    var root = Node()

    init() {
        
    }
    
    func addWord(_ word: String) {
        var current = root
        for ch in word {
            if current.children[ch] == nil {
                current.children[ch] = Node()
            }
            current = current.children[ch]!
        }
        current.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(word, root, 0)
    }

    func dfs(_ word: String, _ node: Node, _ index: Int) -> Bool {
        var current = node
        var words = Array(word)
        for i in index..<words.count {
            let ch = words[i]
            if ch == "." {
                for node in current.children.values {
                    if dfs(word, node, i+1) {
                        return true
                    }
                }
            }
            if current.children[ch] == nil {
                return false
            }
            current = current.children[ch]!
        }
        return current.isEndOfWord
    }

}
