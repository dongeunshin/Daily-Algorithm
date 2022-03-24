var ans = 0

var m : [Int] = []
var p : [Int] = []
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = Int(readLine()!)!
    if input <= 0 {
        m.append(input)
    }else if input > 1 {
        p.append(input)
    }else if input == 1{
        ans += input
    }
}

m.sort()
p.sort(by: >)

if !m.isEmpty {
    if m.count < 2 {
        ans += m[0]
    }else{
        for i in stride(from: 0, to: m.count-1, by: 2) {
            ans += m[i] * m[i + 1]
        }
        if m.count % 2 != 0 {
            ans += m.last!
        }
    }
}

if !p.isEmpty {
    if p.count < 2 {
        ans += p[0]
    }else{
        if p.count % 2 != 0 {
            ans += p.removeLast()
        }
        for i in stride(from: 0, to: p.count-1, by: 2) {
            ans += p[i] * p[i + 1]
        }
    }
}

print(ans)
