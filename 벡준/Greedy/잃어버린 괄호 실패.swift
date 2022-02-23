var input = readLine()!.split(separator: "-").map({String($0)})
var sum = 0
var tmp = 0

for i in 0..<input.count {
    let num = input[i].split(separator: "+").map({Int(String($0))!})
    for n in num {
        tmp += n
    }

    if i == 0 {
        sum += tmp
    }else {
        sum -= tmp
    }
    tmp = 0
}

print(sum)
