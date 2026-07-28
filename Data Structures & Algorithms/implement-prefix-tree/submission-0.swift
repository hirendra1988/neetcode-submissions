class PrefixTree {

    class Node {
        var children = [Character: Node]()
        var isEndOfWord = false
    }

    var root = Node()

    func insert(_ word: String) {
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
        return searchHelper(true, word)
    }

    func startsWith(_ prefix: String) -> Bool {
        return searchHelper(false, prefix)
    }

    func searchHelper(_ isSearch: Bool, _ word: String) -> Bool {
        var current = root
        for ch in word {
            if current.children[ch] == nil {
                return false
            }
            current = current.children[ch]!
        }
        return isSearch ? current.isEndOfWord : true
    }
}
