public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

// Heap By 라이노님 https://gist.github.com/JCSooHwanCho/a3f070c2160bb8c0047a5ddbb831f78e

struct EdgeData : Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    
    var cost : Int
    var node : Int
}


let nmr = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
let itemCntList = readLine()!.split(separator: " ").map({Int(String($0))!})
let inf = Int.max

var graph = Array(repeating: [(Int,Int)]() , count: n)
for _ in 0..<r{
    let line = readLine()!.split(separator: " ").map({Int(String($0))!})
    graph[line[0]-1].append((line[1]-1,line[2]))
    graph[line[1]-1].append((line[0]-1,line[2]))
}



var ans = 0
for i in 0..<n{
    var d = Array(repeating: inf, count: n)
    d[i] = 0
    var pq: Heap = Heap<EdgeData>()
    pq.insert(EdgeData(cost: 0,node: i))
    while(!pq.isEmpty){
        let now = pq.delete()!
        if d[now.node] < now.cost{
            continue
        }
        
        for next in graph[now.node]{
            if now.cost + next.1 < d[next.0]{
                d[next.0] = now.cost + next.1
                pq.insert(EdgeData(cost: now.cost + next.1,node: next.0))
            }
        }
    }
//    print(d)
    var cnt = 0
    for (idx,dd) in d.enumerated(){
        if dd != inf && dd <= m {
            cnt += itemCntList[idx]
        }
    }
    ans = max(ans,cnt)
}

print(ans)
