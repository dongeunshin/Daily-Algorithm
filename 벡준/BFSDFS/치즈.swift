var ans = 0
var board : [[Int]] = []
let rl = readLine()!.split(separator: " ").map{Int(String($0))!}

let h = rl[0]
let w = rl[1]
for _ in 0..<h {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var time = 0
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

var q : [(Int,Int)] = []

while true {
    time += 1
    q.append((0,0))
    var visited = Array(repeating: Array(repeating: 0, count: w), count: h)
    var cnt = 0
    while !q.isEmpty{
        let now = q.removeFirst()
        let x = now.0
        let y = now.1
        for i in 0..<4{
            let xx = x + dx[i]
            let yy = y + dy[i]
            if (0..<h).contains(xx) && (0..<w).contains(yy) && visited[xx][yy] == 0 {
                visited[xx][yy] = 1
                if board[xx][yy] == 1 {
                    board[xx][yy] = 2
                    cnt += 1
                }else{
                    q.append((xx, yy))
                }
            }
        }
    }
    if cnt == 0{
        break
    }
    ans = cnt
    for i in  0..<h{
        for j in 0..<w{
            if board[i][j] == 2 {
                board[i][j] = 0
            }

        }
    }
}


print("\(time - 1) \(ans)")
