iimport Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var ans: [Int64] = []
    for num in numbers{
        let b = String(num, radix: 2)
        var arr = b.map{Int(String($0))!}
        var i = 0
        if let index = arr.lastIndex(of: 0) {
            arr[index] = 1
            i = index
        }else {
            arr.append(1)
        }
        if i != arr.count - 1{
            arr[i+1] = 0
        }
        let binary = arr.map{String($0)}.joined(separator: "")
        ans.append(Int64(binary, radix: 2)!)
    }
    return ans
}
