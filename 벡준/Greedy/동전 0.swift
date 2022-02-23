let arr = readLine()!.split(separator: " ").map{Int($0)!}
let n = arr[0]
var k = arr[1]
var money : [Int] = []
for _ in 0 ..< n {
    money.append(Int(readLine()!)!)
}
money.reverse()

var ans = 0
var i = 0
while k > 0 {
    let cnt = k / money[i]
    ans += cnt
    k -= cnt * money[i]
    i += 1
}
print(ans)
