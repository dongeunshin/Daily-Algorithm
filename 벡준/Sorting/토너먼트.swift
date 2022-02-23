let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = arr[0]
var j = min(arr[1], arr[2])
var h = max(arr[1], arr[2])

var ans = -1
var round = 1

while n > 1{
    if j % 2 != 0 &&  j + 1 == h{
        ans = round
        break
    }
    j = j % 2 == 0 ? j / 2 : j / 2 + 1
    h = h % 2 == 0 ? h / 2 : h / 2 + 1
    n = n % 2 == 0 ? n / 2 : n / 2 + 1

    round += 1
}
print(ans)
