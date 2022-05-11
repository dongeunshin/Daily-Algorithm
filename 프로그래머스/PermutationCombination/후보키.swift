func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}
func isMinimal(_ arr: [Int],_ arrList: [[Int]]) -> Bool {
    let a = Set(arr)
    for ele in arrList {
        let b = Set(ele)
        if arrList.contains(Array(b.intersection(a)).sorted()){
            return false
        }
    }
    return true
}
func solution(_ relation:[[String]]) -> Int {
    var ans = 0
    var ansList : [[Int]] = []
    var visited : [Int] = []
    for i in 0..<relation[0].count{
        visited.append(i)
    }
    for i in 1...relation[0].count {
        let combis = combi(visited, i)
        for combi in combis {
            var keys :[[String]] = []
            for r in relation{
                var tmp : [String] = []
                for ele in combi{
                    tmp.append(r[ele])
                }
                keys.append(tmp)
            }
            if keys.count == Set(keys).count && isMinimal(combi, ansList){
                ans += 1
                ansList.append(combi)
            }
        }
    }
    return ans
}
