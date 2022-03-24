var arr : [Int] = []

let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}
var answers : [String] = []
var dp = [0,1,2,4] + Array(repeating: 0, count: 8)

for num in 4...11{
    dp[num] = dp[num - 1] + dp[num - 2] + dp[num - 3]
}

for num in arr {
    print(dp[num])
}
