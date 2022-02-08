func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var ans = n - lost.count
    var students: [Int] = Array(repeating: 1, count: n)
        
    for i in lost{
        if reserve.contains(i){
            ans += 1
            continue
        }
        students[i - 1] = 0
    }
    var _reserve = reserve
    _reserve.sort()
    for i in _reserve{
        if lost.contains(i) {
            continue
        }
        if i > 1 && students[i - 2] == 0{
            students[i - 2] = 1
            ans += 1
        }else if i < students.count && students[i] == 0{
            students[i] = 1
            ans += 1
        }
    }
    return ans
}
