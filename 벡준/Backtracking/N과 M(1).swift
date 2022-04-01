let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var visited = Array(repeating: false, count: n + 1)
var depth: Int = 0

var stack: [Int] = []

func result(depth: Int) {
    if depth == m {
        print(stack.map{String($0)}.joined(separator: " "))
        return
    }else {
        for i in 1...n {
            if !visited[i]{
                visited[i] = true
                stack.append(i)
                result(depth: depth + 1)
                visited[i] = false
                stack.removeLast()

            }
        }
    }

}

result(depth: depth)
