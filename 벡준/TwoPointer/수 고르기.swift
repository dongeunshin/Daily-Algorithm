let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])
var arr = [Int]()
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}
arr.sort()

var ans = Int.max
var l = 0
var r = 1

while r < arr.count{
    let diff = arr[r] - arr[l]
    if diff == m {
        ans = m
        break
    }
    if diff > m{
        ans = min(ans, diff)
        l += 1
    }else{
        r += 1
    }
}

print(ans)
