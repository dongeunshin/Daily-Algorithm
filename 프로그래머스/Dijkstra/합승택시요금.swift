func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)

    for fare in fares {
        graph[fare[0]][fare[1]] = fare[2]
        graph[fare[1]][fare[0]] = fare[2]
    }

    var sdistance = Array(repeating: Int.max, count: n + 1)
    var queue = [s]
    var idx = 0
    sdistance[s] = 0

    while queue.count > idx {
        let now = queue[idx]
        idx += 1
        for i in 1...n {
            let cost = sdistance[now] + graph[now][i]
            if graph[now][i] >= 0 && sdistance[i] > cost {
                sdistance[i] = cost
                queue.append(i)
            }
        }
    }

    var minCost = Int.max
    for start in 1...n {
        if sdistance[start] == Int.max { continue }

        var distance = Array(repeating: Int.max, count: n+1)
        queue = [start]
        idx = 0
        distance[start] = 0

        while queue.count > idx {
            let now = queue[idx]
            idx += 1

            for i in 1...n {
                let cost = distance[now] + graph[now][i]
                if graph[now][i] >= 0 && distance[i] > cost {
                    distance[i] = cost
                    queue.append(i)
                }
            }
        }

        minCost = min(sdistance[start] + distance[a] + distance[b], minCost)
    }
    return minCost
}
