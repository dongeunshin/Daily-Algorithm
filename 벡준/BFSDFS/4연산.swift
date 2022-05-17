let nm = readLine()!.split(separator: " ")
let s = Int(nm[0])!
let t = Int(nm[1])!

var ans = "-1"
var ansList = Set<Int>()
var q = [(s, "")]
if s == t{
    ans = "0"
}else{
    while !q.isEmpty {
        let curr = q.removeFirst()
        let num = curr.0
        let str = curr.1
        if num == t {
            ans = str
            break
        }
        if num < t{
            let p = num + num
            let t = num * num
            if !ansList.contains(t){
                ansList.insert(t)
                q.append((t, str + "*"))
            }
            if !ansList.contains(p){
                ansList.insert(p)
                q.append((p, str + "+"))
            }
        }
        
        if num > 0 {
            let d = num / num
            let mi = num - num
            if !ansList.contains(d){
                ansList.insert(d)
                q.append((d, str + "/"))
            }
            if !ansList.contains(mi){
                ansList.insert(mi)
                q.append((mi, str + "-"))
            }
        }
    }
}

print(ans)

