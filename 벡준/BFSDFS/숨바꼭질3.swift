let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]
var queue: [(Int, Int)] = []
var visited = Array(repeating: false, count: 100001)
bfs()
func bfs(){
    queue.append((n, 0))
    
    while !queue.isEmpty{
        let pop = queue.removeFirst()
        if pop.0 == k {
            print(pop.1)
            break
        }
        if pop.0 * 2 < 100001 && !visited[pop.0 * 2]{
            visited[pop.0 * 2] = true
            queue.append((pop.0 * 2, pop.1))
        }
        
        if pop.0 - 1 >= 0 && !visited[pop.0 - 1]{
            visited[pop.0 - 1] = true
            queue.append((pop.0 - 1, pop.1 + 1))
        }
        
        if pop.0 + 1 < 100001 && !visited[pop.0 + 1]{
            visited[pop.0 + 1] = true
            queue.append((pop.0 + 1, pop.1 + 1))
        }
        
        
    }
}
