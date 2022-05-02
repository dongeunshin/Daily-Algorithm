func solution(_ n:Int, _ k:Int) -> Int {
    var ans = 0
    var tmpArr :[String] = []
    let num = String(n, radix: k) //.split(separator: "0")
    var tmp = ""

    for ch in num {
        if ch == "0" {
            tmpArr.append(tmp)
            tmp = ""
            continue
        }
        tmp += String(ch)
    }
    tmpArr.append(tmp)

    for num in tmpArr{
        if num == ""{
            continue
        }
        if isPrime(num: Int(num)!){
            ans += 1
        }
    }
    return ans
}
func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) {
            return false
        }
    }
    return true
}

print(solution2(437674, 3))
print(solution2(110011, 10))

