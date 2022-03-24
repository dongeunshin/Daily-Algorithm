let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map({Int(String($0))!})
var dp = Array(repeating: 1, count: n)

for i in 0..<arr.count-1{
    for j in i..<arr.count{
        if arr[i] < arr[j]{
            dp[j] = max(dp[i] + 1, dp[j])
        }
    }
}
var maxvalue = dp.max()!
print(maxvalue)

var tmp : [Int] = []

dp.reverse()
arr.reverse()
for i in 0..<dp.count {
    if dp[i] == maxvalue{
        tmp.append(arr[i])
        maxvalue -= 1
    }
}

//var order = dp.max()!
//for i in stride(from: n - 1, through: 0, by: -1){
//    if dp[i] == order{
//        tmp.append(arr[i])
//        order -= 1
//    }
//
//}

tmp.reverse()
print(tmp.map{String($0)}.joined(separator: " "))

// 배열을 뒤에서 부터 만들어야 함. 1번 숫자부터하면 오답
