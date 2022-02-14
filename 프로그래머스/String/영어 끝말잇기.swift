import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var ans: [Int] = [0,0]
    var wordsDic: [String:Int] = [:]
    var cnt: Int = 0
    var last: Character? = nil
    for word in words{
        if last == nil{
            last = word.last!
        }else {
            if wordsDic.keys.contains(word) || last! != word.first!{
                ans[0] = cnt % n + 1
                ans[1] = cnt / n + 1
                return ans
            }
            last = word.last
        }
        wordsDic[word] = 1
        cnt += 1
    }
    return ans
}
