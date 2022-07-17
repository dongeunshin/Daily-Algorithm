import Foundation

func dfs(visited: inout [Bool], graph: [[Int]], index: Int, size: Int) {
    visited[index] = true  
    for i in 0..<size {
        let target = graph[index][i]
        if visited[i] == false && target == 1 {
            dfs(visited: &visited, graph: graph, index: i, size: size)
        }
    }
}
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var result = 0
    for i in 0 ..< n {
        if visited[i] == false {
            result += 1
            dfs(visited: &visited, graph: computers, index: i, size: n)
        }
    }
    return result
}
