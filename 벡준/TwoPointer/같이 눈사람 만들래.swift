let K = Int(readLine()!)!

let list = readLine()!.split(separator : " ").map{Int(String($0))!}.sorted()
var answer = Int.max
for i in 0..<K-1 {
    for j in i+1..<K {
        let snow1 = list[i]+list[j]
        var l = 0, r = K-1
        
        while l<r {
            while l == i || l == j {
                l += 1
            }
            while r == i || r == j {
                r -= 1
            }
            
            if l>=r { break }
            
            let snow2 = list[l] + list[r]
            answer = min(answer,abs(snow1-snow2))
            if snow1 < snow2 {
                r -= 1
            }else {
                l += 1
            }
        }
    }
}
print(answer)
