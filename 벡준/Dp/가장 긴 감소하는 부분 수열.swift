let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map({Int(String($0))!})

let n = 6
let arr = "10 30 10 20 20 10".split(separator: " ").map({Int(String($0))!})
var dp = Array(repeating: 1, count: arr.count)
for i in 0..<arr.count-1{
    for j in i+1..<arr.count{
        if arr[i] > arr[j]{
            dp[j] = max(dp[i]+1, dp[j])
        }
    }
}
print(dp.max()!)
