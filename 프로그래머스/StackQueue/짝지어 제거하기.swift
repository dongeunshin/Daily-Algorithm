import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    for ch in s{
        stack.append(ch)
        let len = stack.count
        if len >= 2 && stack[len-1] == stack[len-2]{
            stack.removeLast()
            stack.removeLast()
        }
    }
    if stack.count == 0{ return 1}
    return 0
}
