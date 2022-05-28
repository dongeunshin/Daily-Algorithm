func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)

    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }

    cycle([])

    return result
}
let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var ans = 9999999
var Aarr : [[Int]] = Array(repeating: [], count: n)
var infos : [[Int]] = Array(repeating: [], count: k)

for i in 0..<n{
    Aarr[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

for i in 0..<k{
    infos[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}
let w = permutation(Array(0..<k), k)

for ww in w{
    var A = Aarr
    for ii in ww {
        let i = infos[ii]
        let r = i[0]
        let c = i[1]
        let s = i[2]
        var left = (r - s - 1, c - s - 1)
        var right = (r + s - 1, c + s - 1)
        while left != right {
            var tmp = [-1]
            for idx in left.1...right.1{
                tmp.append(A[left.0][idx])
            }
            for idx in (left.0 + 1)...(right.0 - 1){
                tmp.append(A[idx][right.1])
            }
            for idx in stride(from: right.1, through: left.1, by: -1){
                tmp.append(A[right.0][idx])
            }
            for idx in stride(from: right.0 - 1, through: left.0 + 1, by: -1){
                tmp.append(A[idx][left.1])
            }
            tmp[0] = tmp.removeLast()
            var curr = 0
            for idx in left.1...right.1{
                A[left.0][idx] = tmp[curr]
                curr += 1
            }
            for idx in (left.0 + 1)...(right.0 - 1){
                A[idx][right.1] = tmp[curr]
                curr += 1
            }
            for idx in stride(from: right.1, through: left.1, by: -1){
                A[right.0][idx] = tmp[curr]
                curr += 1
            }
            for idx in stride(from: right.0 - 1, through: left.0 + 1, by: -1){
                A[idx][left.1] = tmp[curr]
                curr += 1
            }
            left.0 += 1
            left.1 += 1
            right.0 -= 1
            right.1 -= 1
        }
    }

    for a in A{
        ans = min(ans, a.reduce(0, +))
    }

}
print(ans)
