func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    
    for place in places {
        var pArr: [[Int]] = []
        var isSafe = true
        

        for (i, row) in place.enumerated() {
            for (j, v) in row.enumerated() {
                if v == "P" {
                    pArr.append([i, j])
                }
            }
        }

        for i in 0..<pArr.count {
            if !isSafe { break }
            
            for j in (i+1)..<pArr.count {
                let first = pArr[i] 
                let second = pArr[j] 
                let distance = abs(first[0] - second[0]) + abs(first[1] - second[1])
                
                if distance > 2 { continue }
                
                if distance == 1 {
                    isSafe = false
                    break
                }
                
                if distance == 2 {
                    if (first[0] == second[0]) {
                        if place[first[0]][min(first[1], second[1]) + 1] == "O" {
                            isSafe = false
                            break
                        }
                    } else if (first[1] == second[1]) {
                        if place[min(first[0], second[0]) + 1][first[1]] == "O" {
                            isSafe = false
                            break
                        }
                    } else {
                        if place[first[0]][second[1]] == "O" || place[second[0]][first[1]] == "O" {
                            isSafe = false
                            break
                        }
                    }
                }
            }
        }
        result.append(isSafe ? 1 : 0)
    }
    return result
}
