let n = 4
var w = 1
var ww = 0

var arr = Array(repeating: Array(repeating: 0, count: n), count: n)

var x = 0
var y = 0

var num = 1
var cnt = 1
arr[x][y] = num
num += 1
let dx = [1,0]
let dy = [0,1]

let dx2 = [1,0,0,-1]
let dy2 = [0,-1,1,0]

outer: while x < n && y < n{

    x += dx[w]
    y += dy[w]
    if x >= n || y >= n{
        break outer
    }
    arr[x][y] = num
    num += 1

    for _ in 0...1{
        let xx = dx2[ww]
        let yy = dy2[ww]
        for i in 0..<cnt{
            x += xx
            y += yy
            if x >= n || y >= n{
                break outer
            }
            arr[x][y] = num
            num += 1
        }
        ww = (ww + 1) % 4
    }


    if w == 1{
        w = 0
    }else{
        w = 1
    }
    cnt += 1
}

for a in arr{
    print(a)
}
