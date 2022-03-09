let n = Int(readLine()!)!
var y = readLine()!.split(separator: " ").map{Int($0)!}
var m = Int(readLine()!)!

y.sort()
var s = 0
var e = y.last!
while s <= e {
    let mid = (s + e) / 2
    var tmp = 0
    for yy in y {
        if yy > mid {
            tmp += mid
        }else {
            tmp += yy
        }
    }
    
    if tmp > m {
        e = mid - 1
    }else {
        s = mid + 1
    }
}

print(e)
