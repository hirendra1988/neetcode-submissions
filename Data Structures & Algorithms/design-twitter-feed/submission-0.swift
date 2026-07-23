class Twitter {

    var followers = [Int: Set<Int>]()
    var tweetData = [Int: [(tweetId: Int, timeStamp: Int)]]()
    var timeStamp = 0
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = (tweetId: tweetId, timeStamp: timeStamp)
        timeStamp += 1
        tweetData[userId, default: []] += [tweet]
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var followees = followers[userId, default: Set()]
        followees.insert(userId)
        var tempTweetData = [(tweetId: Int, timeStamp: Int)]()

        for followee in followees {
            if let tweetsData = tweetData[followee] {
                for tweetData in tweetsData {
                    tempTweetData.append(tweetData)
                }
            }
        }
        var result = [Int]()
        let sortedTempTweetData = tempTweetData.sorted { $0.1 > $1.1 }
        for data in sortedTempTweetData {
            result.append(data.tweetId)
            if result.count >= 10 {
                break
            }
        }
        return result
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].remove(followeeId)
    }
}
