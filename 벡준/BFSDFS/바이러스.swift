let n = Int(readLine()!)!
let m = Int(readLine()!)!

var arr : [[Int]] = Array(repeating: [], count: n+1)


for _ in 1...m {
    let temp = readLine()!.split(separator: " ").map({Int($0)!})
    arr[temp[0]].append(temp[1])
    arr[temp[1]].append(temp[0])
}


var visited = Array(repeating: 0, count: n + 1)
var stack : [Int] = []

stack.append(1)
while !stack.isEmpty {
    let node = stack.popLast()!
    visited[node] = 1
    for n in arr[node]{
        if visited[n] == 0{
            stack.append(n)
        }
    }
}
var ans = 0
visited.map({ n in
    if n == 1{
        ans += 1
    }
})
print(ans - 1)
