let n = readLine()!
var nArr = Array(n)
nArr.sort(by: >)
if !nArr.contains("0"){
    print(-1)
}else if nArr.map({Int(String($0))!}).reduce(0, +) % 3 == 0 {
    nArr.remove(at: nArr.firstIndex(of: "0")!)
    print(String(nArr) + "0")
}else{
    print(-1)
}
