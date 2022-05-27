let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var fireList = [FireBall]()
var arr = Array(repeating: Array(repeating: [FireBall](), count: n), count: n)
for _ in 0..<m {
    let rcmsd = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (r,c,m,s,d) = (rcmsd[0]-1, rcmsd[1]-1, rcmsd[2], rcmsd[3], rcmsd[4])

    let fireBall = FireBall(pos: Pos(r: r, c: c), speed: s, mass: m, direction: d)
    fireList.append(fireBall)
}

for _ in 0..<k {
    fireList = fireList.map{$0.move(n)}
    arr = Array(repeating: Array(repeating: [FireBall](), count: n), count: n)

    fireList.forEach { fireball in
        arr[fireball.pos.r][fireball.pos.c].append(fireball)
    }
    let mergeList = arr.flatMap{$0}.filter{ $0.count >= 2}

    for fireballs in mergeList {
        var isEven = false
        var isOdd = false
        var mass = 0
        var speed = 0
        let count = fireballs.count
        for fireball in fireballs {
            if fireball.direction % 2 == 0 {
                isEven = true
            } else {
                isOdd = true
            }

            mass += fireball.mass
            speed += fireball.speed
        }

        mass /= 5
        speed /= count

        let pos = fireballs.first!.pos

        if mass == 0 {
            arr[pos.r][pos.c] = []
            continue
        }

        let dirs = isEven && isOdd ? [1,3,5,7] : [0,2,4,6]
        arr[pos.r][pos.c] = dirs.map{FireBall(pos: pos, speed: speed, mass: mass, direction: $0)}
    }
    fireList = arr.flatMap{$0}.flatMap{$0}
}

print(fireList.reduce(0, { partialResult, fireball in
    partialResult + fireball.mass
}))
