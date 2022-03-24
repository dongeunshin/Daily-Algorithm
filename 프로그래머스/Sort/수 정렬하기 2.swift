let n = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()

for i in 0..<n {
    print("\(arr[i])")
}
