var n = 4  //토핑의 종류의 수
let a = 20 //도우의 가격
let b = 3  //토핑의 가격
let calA = 900
var calB = [300,100,400,1300]
calB.sort(by: >)

var price = a + b * n
var cal = calA + calB.reduce(0, +)
var ans = cal / price

n -= 1
while n > 0 {
    let p = a + b * n
    let c = calA + calB[0..<n].reduce(0, +)
    let tmp = c / p
    if tmp > ans {
        ans = tmp
    }
    n -= 1
}
print(ans)
