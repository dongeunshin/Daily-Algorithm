let N = Int(readLine()!)!

var A = Array(repeating: 0, count: N)
var B = readLine()!.split(separator: " ").map { Int($0)! }


var sum = B.reduce(0, +)
var ans = 0
while sum != 0 {
    var flag = true
    for i in 0..<N {
        if B[i] % 2 != 0 {
            flag = false
            B[i] -= 1
            ans += 1
            sum -= 1
        }
    }

    if flag {
        for i in 0..<B.count {
            B[i] /= 2
            sum -= B[i]
        }
        ans += 1
    }
}

print(ans)
