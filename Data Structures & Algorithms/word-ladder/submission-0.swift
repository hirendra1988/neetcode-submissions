class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let alphabets = "abcdefghijklmnopqrstuvwxyz"
        var setWords = Set(wordList)
        if !setWords.contains(endWord) {
            return 0
        }
        var queue = [(String, Int)]()
        queue.append((beginWord, 1))

        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            if word == endWord {
                return step
            }
            var wordArray = Array(word)
            for i in 0..<wordArray.count {
                let temp = wordArray[i]
                for ch in alphabets where ch != wordArray[i] {
                    wordArray[i] = ch
                    let modifiedStr = String(wordArray)
                    if setWords.contains(modifiedStr) {
                        queue.append((modifiedStr, step + 1))
                        setWords.remove(modifiedStr)
                    }
                }
                wordArray[i] = temp
            }
        }
        return 0
     }
}