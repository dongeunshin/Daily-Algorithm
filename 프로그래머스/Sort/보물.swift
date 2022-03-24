let n = readLine()!
var a = readLine()!.split(separator: " ").map{Int($0)!}
var b = readLine()!.split(separator: " ").map{Int($0)!}
//let n = 5
//var a = "1 1 1 6 0".split(separator: " ").map{Int($0)!}
//var b = "2 7 8 3 1".split(separator: " ").map{Int($0)!}

var ans = 0
for arr in zip(a.sorted(), b.sorted().reversed()) {
    ans += arr.0 * arr.1
}
print(ans)
