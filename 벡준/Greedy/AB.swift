let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, k) = (nk[0], nk[1])


var arr = Array(repeating: "B", count: n)

for i in 0..<n{
    arr[i] = "A"
    var cnt = 0
    for i in 0..<(n - 1){
        if arr[i] == "A"{
            for j in i+1..<n{
                if arr[j] == "B" {
                    cnt += 1
                }
            }
        }
    }
    if cnt == k{
        break
    }else if cnt > k {
        arr[i] = "B"
    }
}

let str = arr.joined()
print(str)
if (!arr.contains("A") || !arr.contains("B")) && k != 0{
    print(-1)
}else{
    print(str)
}
