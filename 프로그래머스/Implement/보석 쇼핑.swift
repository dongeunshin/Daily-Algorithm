func solution(_ gems:[String]) -> [Int] {
    var ans = [Int]()
    var minL: Int = 999999
    var d :[String:Int] = [:]
    let gemSetCnt = Set(gems).count
    if gemSetCnt == 1{
        return [1,1]
    }
    var s = 0
    var e = 0
    while e < gems.count && s < gems.count{
        let g = gems[e]
        if let cnt = d[g] {
            d[g] = cnt + 1
        }else{
            d[g] = 1
        }
        if d.count == gemSetCnt{
            let newL = e - s
            if newL < minL{
                minL = newL
                ans = [s + 1, e + 1]
            }
            if s == e {
                break
            }
            d[gems[s]]! -= 1
            if d[gems[s]]! <= 0{
                d.removeValue(forKey: gems[s])
            }
            s += 1
        }else{
            e += 1
        }
    }
    return ans
}
