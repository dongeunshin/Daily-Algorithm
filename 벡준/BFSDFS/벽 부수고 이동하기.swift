var ans = -1
let rl = readLine()!.split(separator: " ").map({Int(String($0))!})
let (n,m) = (rl[0],rl[1])
var board : [[Int]] = []
for _ in 0..<n{
    board.append(Array(readLine()!).map{Int(String($0))!})
}
let dx = [0,1,0,-1]
let dy = [-1,0,1,0]

var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
var q : [((Int, Int,Int), Int)] = [((0,0,1),1)]

visited[0][0][1] = 1
var index = 0
while q.count > index {
    let node = q[index]
    let x = node.0.0
    let y = node.0.1
    let depth = node.0.2
    let chance = node.1
    if x == n - 1 && y == m - 1 {
        ans = depth
        break
    }
    for i in 0..<4{
        let xx = x + dx[i]
        let yy = y + dy[i]
        if (0..<n).contains(xx) && (0..<m).contains(yy) && visited[xx][yy][chance] == 0 {
            if board[xx][yy] == 0{
                visited[xx][yy][chance] = 1
                q.append(((xx,yy, depth + 1), chance))
            }else if board[xx][yy] == 1 && chance == 1{
                visited[xx][yy][chance - 1] = 1
                q.append(((xx,yy, depth + 1), chance - 1))
            }
        }
    }
    index += 1
}


print(ans)
