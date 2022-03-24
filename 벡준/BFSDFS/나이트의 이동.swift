let r1 = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = r1[0]
let m = r1[1]
let r2 = readLine()!.split(separator: " ").map({Int(String($0))!})
let k = (r2[0] - 1, r2[1] - 1)
var arr: [(Int,Int)] = []
for _ in 0..<m {
    let r3 = readLine()!.split(separator: " ").map({Int(String($0))!})
    arr.append((r3[0],r3[1]))
}

let d = [(-2,-1),(-2,1), (-1,-2), (-1,2), (1,-2), (1,2), (2,-1), (2,1)]
var ans : [Int] = []
for e in arr{
    var q = [k]
    var cnt = 0
    var checked = Array(repeating: Array(repeating: 0, count: n), count: n)
outerLoop: while !q.isEmpty{
        let now = q.removeFirst()
        let x = now.0
        let y = now.1
        cnt += 1

        for i in 0..<8{
            let xx = x + d[i].0
            let yy = y + d[i].1
            if (0..<n).contains(xx) && (0..<n).contains(yy) && checked[xx][yy] == 0{
                checked[xx][yy] = checked[x][y] + 1
                if xx == e.0 - 1 && yy == e.1 - 1{
                    ans.append(checked[xx][yy])
                    break outerLoop
                }
                q.append((xx,yy))
            }
        }
    }
}

print(ans.map({String($0)}).joined(separator: " "))
