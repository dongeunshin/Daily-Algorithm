let s = readLine()!
var t = readLine()!
var ans = 0

while s.count != t.count {
    let last =  t.removeLast()
    if last == "B"{
        t = String(t.reversed())
    }
    if s == t {
        ans = 1
        break
    }
}
print(ans)
