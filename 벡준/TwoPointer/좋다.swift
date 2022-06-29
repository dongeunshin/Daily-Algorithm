let n = Int(String(readLine()!))!
let arr = readLine()!.split(separator: " ").map({Int(String($0))!}).sorted()

var ans = 0

for i in 0..<n{
    let tmp = arr[..<i] + arr[(i + 1)...]
    var l = 0
    var r = tmp.count - 1
    while l < r {
        let total = tmp[l] + tmp[r]
        if total == arr[i]{
            ans += 1
            break
        }
        
        if total < arr[i]{
            l += 1
        }else {
            r -= 1
        }
    }
}


print(ans)
