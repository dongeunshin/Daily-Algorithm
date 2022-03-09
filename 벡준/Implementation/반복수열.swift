let si = readLine()!.split(separator: " ").map{Int($0)!}
let a = si[0]
let p = si[1]

var arr : [Int] = [a]
while !arr.isEmpty {
    var n = arr.last!
    var new = 0
    while n != 0 {
        var t = n % 10
        for _ in 1..<p {
            t *= n % 10
        }
        n /= 10
        new += t
    }
    if arr.contains(new){
        let index = arr.firstIndex(of: new)!
        print(arr[0..<index].count)
        break
    }
    arr.append(new)

}
