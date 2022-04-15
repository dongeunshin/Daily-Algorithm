let LC = readLine()!.split(separator: " ").map{Int(String($0))!}
let L = LC[0]
let C = LC[1]
let arr = readLine()!.split(separator: " ").map{String($0)}.sorted()
let vowel = ["a","e","i","o","u"]
var depth = 0
var visited: [Bool] = Array(repeating: false, count: C)
var stack: [String] = []

func dfs(_ depth: Int, _ start: Int){
    if depth == L{
        var cnt = 0
        for i in stack{
            if vowel.contains(i){
                cnt += 1
            }
        }

        if cnt > 0 && stack.count - cnt > 1 {
            print(stack.joined(separator: ""))
        }
        return
    }

    for i in start..<C{
        if !visited[i] {
            visited[i] = true
            stack.append(arr[i])
            dfs(depth + 1, i)
            visited[i] = false
            stack.removeLast()
        }
    }

}

dfs(depth, 0)
// DFS + Backtraking
