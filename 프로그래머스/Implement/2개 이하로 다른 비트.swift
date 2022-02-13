import Foundation

func convertTo16(_ b:String) -> String{
    var binary = b
    if binary.count != 16 {
        binary = String(repeating: "0", count: (16 - binary.count)) + binary
    }
    return binary
}
func solution(_ numbers:[Int64]) -> [Int64] {
    var ans: [Int64] = []
    for num in numbers{
        var i: Int64 = 1
        while true{
            var binary = String(num, radix: 2)
            var nextB = String(num + i, radix: 2)
            binary = convertTo16(binary)
            nextB = convertTo16(nextB)
            var cnt = 0
            for index in 0..<binary.count{
                if binary[binary.index(binary.`startIndex`, offsetBy: index)] != nextB[nextB.index(nextB.startIndex, offsetBy: index)]{
                    cnt += 1
                }
            }
            if cnt == 1 || cnt == 2{
                ans.append(Int64(num + i))
                break
            }
            i += 1
        }
    }
    return ans
}
